import 'package:flutter/material.dart';
import 'package:datedaycalculator/pages/about.dart';
import 'package:datedaycalculator/pages/home.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {'/': (context) => home(),
    '/about': (context) => about()},
  ));
}
