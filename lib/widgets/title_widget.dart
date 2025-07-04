import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nordisk/theme/theme_colors.dart';

class TitleWidget extends StatelessWidget {
  final String title;

  const TitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.montserrat(
        fontWeight: FontWeight.bold,
        color: ThemeColors.primary,
        fontSize: 16,
      ),
    );
  }
}
