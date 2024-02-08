import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/main_page.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(MaterialApp(
      title: 'sabz&gorocrush',
      home: MainPage()));
}


