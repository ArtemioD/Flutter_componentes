import 'package:flutter/material.dart';

class ImputPage extends StatefulWidget {
  const ImputPage({Key? key}) : super(key: key);

  @override
  _ImputPageState createState() => _ImputPageState();
}

class _ImputPageState extends State<ImputPage> {
  // lateal campo significa que el campo se inicializará cuando lo use por primera vez
  //late String _nombre;
  String _nombre = '';
  String _email = '';
  String _fecha = '';
  TextEditingController _fechaNac = TextEditingController();
  List<String> _poderes = ['Volar', 'Rayos X', 'Super Aliento', 'Super Fuerza'];
  String _poderSel = 'Volar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de Texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearNombre(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          Divider(),
          _crearDropDown(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  // *************************************
  // ************** metodos **************

  Widget _crearNombre() {
    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            //borderRadius: BorderRadius.circular(20.0),
            ),
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'Aca va su Nombre...',
        labelText: 'Nombre',
        helperText: 'Texto de ayuda',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
      ),
      // valor de input
      onChanged: (valor) {
        _nombre = valor;
        setState(() {});
        //print(_nombre);
      },
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            //borderRadius: BorderRadius.circular(20.0),
            ),
        hintText: 'Aca va su Email...',
        labelText: 'Email',
        helperText: 'Texto de ayuda',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
      ),
      // valor de input
      onChanged: (valor) => setState(() {
        _email = valor;
      }),
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true, // para password
      decoration: InputDecoration(
        border: OutlineInputBorder(
            //borderRadius: BorderRadius.circular(20.0),
            ),
        hintText: 'Aca va su Password...',
        labelText: 'Password',
        helperText: 'Texto de ayuda',
        suffixIcon: Icon(Icons.lock_clock),
        icon: Icon(Icons.lock),
      ),
      // valor de input
      onChanged: (valor) => {},
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      controller: _fechaNac,
      enableInteractiveSelection: false, // no se puede copiar
      decoration: InputDecoration(
        border: OutlineInputBorder(
            //borderRadius: BorderRadius.circular(20.0),
            ),
        hintText: 'Aca va su Fecha de nacimiento...',
        labelText: 'Fecha de nacimiento',
        helperText: 'Texto de ayuda',
        suffixIcon: Icon(Icons.calendar_today_outlined),
        icon: Icon(Icons.date_range),
      ),
      // valor de input
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _selectDate(context);
      },
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2025),
        locale: Locale('es', 'ES'));

    if (picked != null) {
      _fecha = picked.toString();
      _fechaNac.text = _fecha;
      setState(() {});
    }
  }

  List<DropdownMenuItem<String>> getOptions() {
    List<DropdownMenuItem<String>> lista = [];
    _poderes.forEach((element) {
      lista.add(DropdownMenuItem(
        child: Text(element),
        value: element,
      ));
    });
    return lista;
  }

  Widget _crearDropDown() {
    return Row(
      children: [
        Icon(Icons.select_all),
        SizedBox(
          width: 30.0,
        ),
        Expanded(
          // Widget para usar todo el espasio que tiene
          child: DropdownButton(
            value: _poderSel,
            items: getOptions(),
            onChanged: (opt) {
              setState(() {
                _poderSel = opt.toString();
              });
              //print(opt);
            },
          ),
        ),
      ],
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre: $_nombre'),
      subtitle: Text('Email: $_email'),
      trailing: Text(_poderSel),
    );
  }
}
