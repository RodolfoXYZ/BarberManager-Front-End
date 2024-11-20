import 'package:barbershop_app/views/LoadPage.dart';
import 'package:barbershop_app/views/LoginPage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoadPage(),
    );
  }
}
