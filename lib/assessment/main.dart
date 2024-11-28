import 'package:flutter/material.dart';
import 'package:student/assessment/screen/AddScreen.dart';
import 'package:student/assessment/screen/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crud Practical',
      home: TaskScreen(),
    );
  }
}
