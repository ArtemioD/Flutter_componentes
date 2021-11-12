import 'package:componentes/scr/pages/alert_page.dart';
import 'package:componentes/scr/routes/routs.dart';
import 'package:flutter/material.dart';
//------------------------------------
import 'package:flutter_localizations/flutter_localizations.dart';
// agregar sdk a pubspec.yaml
//------------------------------------

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//------------------------------------
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', 'US'), // English, no country code
        Locale('es', 'ES'), // Spanish, no country code
      ],
//------------------------------------
      title: 'Componentes App',
      debugShowCheckedModeBanner: false,
      //home: HomePage()
      initialRoute: '/',
      routes: getApplicationRoutes(),
      onGenerateRoute: (RouteSettings settings) {
        //print("ruta llamada... ${settings.name}");
        // si la ruta no existe me manda a esta por defecto
        return MaterialPageRoute(
            builder: (BuildContext contect) => AlertPage());
      },
    );
  }
}
