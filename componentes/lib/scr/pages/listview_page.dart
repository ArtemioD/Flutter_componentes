import 'dart:async';

import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  ScrollController _controllerScroll = ScrollController();

  List<int> _listNumeros = [];
  int _ultimo = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _agregar5();
    _controllerScroll.addListener(() {
      if (_controllerScroll.position.pixels ==
          _controllerScroll.position.maxScrollExtent) {
        _fechData();
      }
    });
  }

// destruimos el _controllerScroll cuando salimosde la pagina
  @override
  void dispose() {
    // destruimos el _controllerScroll cuando salimosde la pagina
    _controllerScroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: Stack(
        children: <Widget>[
          _crearLista(),
          _crearLoading(),
        ],
      ),
    );
  }

  // *************************************
  // ************** metodos **************

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: _obtenerPrimeros,
      child: ListView.builder(
          controller: _controllerScroll,
          itemCount: _listNumeros.length,
          itemBuilder: (BuildContext context, int i) {
            final _imgen = _listNumeros[i];
            return FadeInImage(
              placeholder: AssetImage(
                  'assets/jar-loading.gif'), // imagen por defecto mientras carge el otro,
              image: NetworkImage(
                  'http://picsum.photos/500/300/?image=$_imgen'), // numero de imagen que sacaos de lista
            );
          }),
    );
  }

  void _agregar5() {
    for (var i = 0; i < 5; i++) {
      _ultimo++;
      _listNumeros.add(_ultimo);
    }
    setState(() {});
  }

  Future _fechData() async {
    _isLoading = true;
    setState(() {});
    final duration = Duration(seconds: 2);
    return Timer(duration, _respuestaHTTP);
  }

  void _respuestaHTTP() {
    _isLoading = false;
    _controllerScroll.animateTo(_controllerScroll.position.pixels + 100,
        curve: Curves.fastOutSlowIn, duration: Duration(milliseconds: 250));
    _agregar5();
  }

  Widget _crearLoading() {
    Widget a;
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(
            height: 15.0,
          )
        ],
      );
    } else {
      return Container();
    }
  }

  Future<Null> _obtenerPrimeros() async {
    final duration = Duration(seconds: 2);
    Timer(duration, _volver5);
    return Future.delayed(duration);
  }

  void _volver5() {
    _listNumeros.clear();
    _ultimo++;
    _agregar5();
  }
}
