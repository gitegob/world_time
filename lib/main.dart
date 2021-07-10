import 'package:flutter/material.dart';
import 'package:world_time/screens/choose_location.dart';
import 'package:world_time/screens/home.dart';
import 'package:world_time/screens/loading.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(brightness: Brightness.dark),
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation()
    },
  ));
}
