import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opciones = ["uno", "dos", "tres", "cuatro", "cinco"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Componentes Temp"),
      ),
      body: ListView(children: _crearItemsCorta()), //_crearItems()
    );
  }

  List<Widget> _crearItems() {
    List<Widget> lista = <Widget>[];
    for (String item in opciones) {
      final tempWidget = ListTile(title: Text(item + " 'tems 1'"));

      lista
        ..add(tempWidget)
        ..add(const Divider(
          color: Colors.black,
          height: 30.0,
        ));

      /*lista.add(tempWidget);
      lista.add(const Divider(
        color: Colors.black,
        height: 30.0,
      ));*/
    }
    return lista;
  }

  List<Widget> _crearItemsCorta() {
    return opciones.map((e) {
      return Column(
        children: [
          ListTile(
            title: Text(e + "!"),
            subtitle: Text("Subtitulo de algo"),
            leading: const Icon(
              Icons.account_balance_wallet,
              color: Colors.blueAccent,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.green[900],
            ),
            onTap: () {},
          ),
          const Divider(
            color: Colors.black,
            height: 30.0,
          ),
        ],
      );
    }).toList();
  }
}
