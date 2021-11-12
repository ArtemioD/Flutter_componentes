// ignore_for_file: avoid_print, prefer_const_constructors, use_key_in_widget_constructors

import 'package:componentes/scr/pages/alert_page.dart';
import 'package:componentes/scr/providers/menu_pr.dart';
import 'package:componentes/scr/utils/icono_str_utul.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Componentes"),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: menuProvider.cargraData(),
      initialData: [], // si la lista tarda o es null
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        //print("builder");
        //print(snapshot.data);

        return ListView(
          children: _listaItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    print(data);

    final List<Widget> options = [];

    for (var i in data) {
      final widgetTemp = ListTile(
        title: Text(i["texto"]),
        leading: getIcon(i['icon']),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.black87,
        ),
        onTap: () {
          Navigator.pushNamed(context, i["ruta"]);

          /*final route = MaterialPageRoute(
            builder: (context) => AlertPage(),
          );
          Navigator.push(context, route);*/
        },
      );

      options
        ..add(widgetTemp)
        ..add(Divider());
    }

    return options;
  }
}
