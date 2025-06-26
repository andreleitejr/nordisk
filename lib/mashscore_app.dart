import 'package:flutter/material.dart';
import 'package:nordisk/auth/auth_handler.dart';
import 'package:nordisk/welcome_screen.dart';


class MashscoreApp extends StatelessWidget {
  const MashscoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mashscore de Saúde',
      theme: ThemeData(
        primaryColor: const Color(0xFF001964),
        fontFamily: 'sans-serif',
      ),
      home: WelcomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
