import 'package:flutter/material.dart';
import 'package:login/regPage.dart';
import 'loginPage.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RegPage(),
    );
  }
}


