import 'package:flutter/material.dart';

extension AppColorsExtension on BuildContext {
  Color get bgColor => Theme.of(this).brightness == Brightness.light ? const Color(0xFFFFFFFF) : const Color(0xFF121212);

  Color get textColor =>
      Theme.of(this).brightness == Brightness.light ? const Color(0xFF000000) : const Color(0xFFFFFFFF);

  Color get pinkColor => Theme.of(this).brightness == Brightness.light ? const Color(0xFFFFC0CB) : const Color(0xFDDFB6C1);

  Color get whiteColor => const Color(0xFFFFFFFF);

  Color get blackColor => const Color(0xFF121212);

  // Проверка темы
  bool get isDark => Theme.of(this).brightness == Brightness.dark;
}