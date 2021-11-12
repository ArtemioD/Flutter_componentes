import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({Key? key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 150.0;
  // bool? lo que significa que puede ser nulo o booleano
  // bool? _blokiarCheck = false;
  bool _blokiarCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearChekBox(),
            _crearSwitch(),
            Expanded(child: _crearImagen()),
          ],
        ),
      ),
    );
  }

  // *************************************
  // ************** metodos **************

  Widget _crearSlider() {
    return Slider(
        activeColor: Colors.indigoAccent,
        // parece q label funca solo con divisiones
        label: 'Tamaño de la imgen',
        //divisions: 10, // son puntitos
        value: _valorSlider,
        min: 100.0,
        max: 200.0,
        onChanged: (_blokiarCheck)
            ? null
            : (valor) {
                _valorSlider = valor;
                //print(valor);
                setState(() {});
              });
  }

  Widget _crearChekBox() {
    /*return Checkbox(
        value: _blokiarCheck,
        onChanged: (valor) {
          valor ??= false; // if (valor == null) valor = false;
          _blokiarCheck = valor;
          setState(() {});
          //print(valor);
        });*/

    return CheckboxListTile(
        title: Text(
          'Bloquiar slider',
          style: TextStyle(color: Colors.black),
        ),
        value: _blokiarCheck,
        onChanged: (valor) {
          // puede devolver null
          valor ??= false; // if (valor == null) valor = false;
          _blokiarCheck = valor;
          setState(() {});
        });
  }

  Widget _crearSwitch() {
    return SwitchListTile(
        title: Text(
          'Bloquiar slider',
          style: TextStyle(color: Colors.black),
        ),
        value: _blokiarCheck,
        onChanged: (valor) {
          // no puede devolver null
          _blokiarCheck = valor;
          setState(() {});
        });
  }

  Widget _crearImagen() {
    // uso FadeInImage() y no Image() para poder poner un placeholder
    return FadeInImage(
      image: NetworkImage(
          'https://e00-elmundo.uecdn.es/television/programacion-tv/img/v2/programas/0d/575501.png'),
      placeholder: AssetImage(
          'assets/jar-loading.gif'), // imagen por defecto mientras carge el otro
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }
}
