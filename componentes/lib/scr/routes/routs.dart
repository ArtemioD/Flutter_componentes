import 'package:componentes/scr/pages/animated_container.dart';
import 'package:componentes/scr/pages/alert_page.dart';
import 'package:componentes/scr/pages/avatar.dart';
import 'package:componentes/scr/pages/card_page.dart';
import 'package:componentes/scr/pages/home_page.dart';
import 'package:componentes/scr/pages/input_page.dart';
import 'package:componentes/scr/pages/listview_page.dart';
import 'package:componentes/scr/pages/slider_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertPage(),
    'avatar': (BuildContext context) => AvatarPage(),
    'card': (BuildContext context) => CardPage(),
    'animatedContainer': (BuildContext context) => AnimatedContainerPage(),
    'inputs': (BuildContext context) => ImputPage(),
    'slider': (BuildContext context) => SliderPage(),
    'list': (BuildContext context) => ListViewPage()
  };
}
