import 'package:flutter/material.dart';
import 'resources/colors.dart';
import 'package:runico_ufabc/components/user.dart';
import 'package:provider/provider.dart';
import 'package:runico_ufabc/screens/initial_screeen.dart';
import 'package:runico_ufabc/screens/home.dart';
import 'package:runico_ufabc/data/menu_dao.dart';

void main() {
  runApp(
    Builder(
      builder: (context) {
        return ChangeNotifierProvider(
          create: (_) => UserProvider(),
          child: const MyApp(),
        );
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    MenuDao().beginInitialMenu();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: coresufabc,
      ),
      routes: {
        '/home': (context) => const HomePage(),
      },
      home: const InititalScreen(),
    );
  }
}
