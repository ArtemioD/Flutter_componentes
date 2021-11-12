// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {
  List<dynamic> opsiones = [];

  _MenuProvider() {
    //cargraData();
  }

  Future<List<dynamic>> cargraData() async {
    final resp = await rootBundle.loadString("data/menu_opts.json");
    Map dataMap = json.decode(resp);
    //print("menu start");
    //print(dataMap['rutas']);
    //print("menu finish");
    opsiones = dataMap['rutas'];

    return opsiones;
  }
}

final menuProvider = _MenuProvider();
