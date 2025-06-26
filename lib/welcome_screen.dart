import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nordisk/auth/auth_handler.dart';
import 'package:nordisk/mashscore_app.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/background.jpg', fit: BoxFit.cover),
          ),

          // Logo centralizado
          Positioned(
            top: 75,
            left: 0,
            right: 0,

            child: Container(
              padding: const EdgeInsets.all(48),
              child: Column(
                children: [
                  Center(
                    child: Image.asset(
                      'assets/logo.png',
                      width: 128,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 400),
                  Text(
                    'Promovendo mudanças para prevenir doenças crônicas',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Estamos trabalhando em parceria para criar um futuro com menos pessoas vivendo com diabetes tipo 2 e obesidade.',
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),

          // Botão no rodapé
          Positioned(
            left: 24,
            right: 24,
            bottom: 48,
            child: SizedBox(
              height: 56,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AuthHandler(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.indigo,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Entrar',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
