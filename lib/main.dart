import 'package:flutter/material.dart';
import 'resources/colors.dart';
import 'screens/home.dart';
import 'screens/credits_selection.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: coresufabc,
      ),
      home: HomePage(),
    );
  }
}
