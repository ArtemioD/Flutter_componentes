import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cards"),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10.0, // sombra de la tarjeta
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)), // border
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.monetization_on,
              color: Colors.blue,
            ),
            title: Text('¿Por qué sube el dólar?'),
            subtitle: Text('El dólar es afectado por la oferta y la demanda,'
                'cuando hay más demanda que oferta el precio sube'
                ' y cuando hay más oferta que demanda, el precio baja. ...'
                ' Si es muy difícil de conseguir, quien lo necesita está'
                ' dispuesto a pagar más y, por consecuencia, el precio sube.'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: () {}, child: Text('Cancelar')),
              TextButton(onPressed: () {}, child: Text('Ok'))
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    final card = Container(
      child: Column(
        children: [
          FadeInImage(
            image: NetworkImage(
                'https://fotoarte.com.uy/wp-content/uploads/2019/03/Landscape-fotoarte.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(
                milliseconds: 20), // para que el imagen enntre mas rapido
            height: 250.0, // ancho
            fit: BoxFit.cover, // como la imagenocupa el espasio que tiene
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('Imagen de la planeta tierra'),
          )
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                spreadRadius: 2.0,
                offset: Offset(2.0, 10.0))
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: card,
      ),
    );
  }
}
