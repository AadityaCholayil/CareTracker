import 'package:flutter/material.dart';

class CustomTheme {
  // static Color get bg => const Color(0xFFF9FAFF);

  static Color get white => const Color(0xFFFFFFFF);

  static Color get cardShadow => const Color(0xFFCCD4FF).withOpacity(0.35);

  static Color get onAccent => const Color(0xFFFFFFFF);

  static Color get accent => const Color(0xFF16171B);

  static Color get grey => const Color(0xFFE8EAF0);

  static Color get t1 => const Color(0xFF16171B);

  static Color get t2 => const Color(0xFF6A6A6A);

  static Color get t3 => const Color(0xFFFFFFFF);

  static ThemeData getTheme(BuildContext context) {
    return ThemeData.from(
      textTheme: Theme.of(context).textTheme.apply(
            fontFamily: 'Poppins',
          ),
      colorScheme: const ColorScheme.light().copyWith(
        primary: accent,
        onPrimary: t1,
        background: white,
        surface: white,
      ),
    );
  }
}
