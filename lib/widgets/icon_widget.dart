import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nordisk/theme/theme_colors.dart';

final class IconWidget extends StatelessWidget {
  const IconWidget({
    super.key,
    required this.icon,
    this.onPressed,
    this.color = ThemeColors.primary,
    this.size = 20,
    this.padding = EdgeInsets.zero,
  });

  final String icon;
  final VoidCallback? onPressed;
  final Color color;
  final double size;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: padding,
        child: SvgPicture.asset(
          icon,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
          width: size,
          height: size,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
