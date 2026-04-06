import 'package:flutter/material.dart';

class AppColors {
  // Светлая тема
  static const Color lightBackground = Color(0xFFFFFFFF);
  static const Color lightText = Color(0xFF000000);
  static const Color pinkLight = Color(0xFFFFB6C1); // #FFB6C1
  static const Color pinkDark = Color(0xFFFFC0CB);  // #FFC0CB

  // Темная тема
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkText = Color(0xFFFFFFFF);

  // Получение цвета в зависимости от темы
  static Color background(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkBackground
        : lightBackground;
  }

  static Color text(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? darkText
        : lightText;
  }

  static Color get pink1 => pinkLight; // #FFB6C1
  static Color get pink2 => pinkDark;  // #FFC0CB
}