import 'package:bmi_calculator/pages/mainpage.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BIM CALCULATOR',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF0A0E21), elevation: 0),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
      ),
      home: const MainPage(),
    );
  }
}
