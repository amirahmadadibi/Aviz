import 'package:aviz/DI/di.dart';
import 'package:aviz/Features/Home/view/home_screen.dart';
import 'package:aviz/source/home_source/home_raw.dart';
import 'package:flutter/material.dart';

void main() async {
  await getInInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
