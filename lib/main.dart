import 'package:flutter/material.dart';
import 'package:news_last_app/presentation/screens/home_screen/home_screen/home_screen.dart';
import 'package:news_last_app/styles/theme_manager/theme_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(context),
      home: const HomeScreen(),
    );
  }
}

