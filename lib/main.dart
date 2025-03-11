import 'package:flutter/material.dart';
import 'package:latian_praktikum/home_page.dart';
import 'package:latian_praktikum/login_page.dart';
import 'package:latian_praktikum/menu_page.dart';
import 'package:latian_praktikum/about_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // root aplikasi
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 217, 255, 0)),
        useMaterial3: true,
      ),
      home: LoginPages(),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => LoginPages(),
        '/home': (BuildContext context) => HomePage(),
        '/order': (BuildContext context) => MenuPage(), 
        '/about': (BuildContext context) => AboutPage(),
      },
    );
  }
}


