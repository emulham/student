import 'package:flutter/material.dart';
import 'package:studen/Home_page.dart';
import 'Home_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Score App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  HomePage()
    );
  }
}
