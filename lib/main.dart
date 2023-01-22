import 'package:flutter/material.dart';
import 'package:token/screens/home/screens/drag/drag_items.dart';
import 'package:token/screens/home/screens/home_screen.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DragScreen(),
    );
  }
}
