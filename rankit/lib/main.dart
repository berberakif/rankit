import 'package:flutter/material.dart';
import 'package:rankit/AppScreen.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RANK IT',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: AppScreen(),
    );
  }
}