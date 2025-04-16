import 'package:flutter/material.dart';
import 'package:zoom_clone/screens/loginScreen.dart';
import 'package:zoom_clone/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zoom Clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      routes: {"/login": (context) => const LoginScreen()},
      home: const LoginScreen(),
    );
  }
}
