import 'package:flutter/material.dart';
import 'package:lab7/widgets/main_screen/main_Screen_widget.dart';
import 'package:lab7/widgets/secondScreen/second_screen_widget.dart';
void main() {
  runApp(MaterialApp(
    routes: {
      '/':(context) => MainScreenWidget(),
      '/second_screen':(context) => SecondScreenWidget(),
    },
    initialRoute: '/',
  ));
}

