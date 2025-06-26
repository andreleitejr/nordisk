import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nordisk/main_screen.dart';
import 'package:nordisk/theme/theme_colors.dart';


// 3. Gerenciador de Autenticação
class AuthHandler extends StatefulWidget {
  const AuthHandler({super.key});

  @override
  _AuthHandlerState createState() => _AuthHandlerState();
}

class _AuthHandlerState extends State<AuthHandler> {
  late StreamSubscription<User?> _authSubscription;
  User? _user;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _authSubscription = FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user == null) {
        try {
          await FirebaseAuth.instance.signInAnonymously();
        } catch (e) {
          debugPrint("Erro ao fazer login anônimo: $e");
        }
      } else {
        setState(() {
          _user = user;
          _isLoading = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _authSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [ThemeColors.primary, Color(0xFF234095)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(color: Colors.white),
                  SizedBox(height: 16),
                  Text('Carregando', style: TextStyle(color: Colors.white, fontSize: 20)),
                ],
              )
          ),
        ),
      );
    }
    return MainScreen(user: _user!);
  }
}
