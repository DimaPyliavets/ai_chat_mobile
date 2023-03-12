import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  colorScheme: ThemeData.light().colorScheme.copyWith(
    primary: Color(0xFFE5E5E5),
    onPrimary: Colors.black,
    secondary: Color(0xFFE57373),
    onSecondary: Color(0xFF000000),
    error: Color(0xFFD32F2F),
    surface: Color(0xFFF5F5F5),
    background: Color(0xFFF1F1F1),
  ),
);

final darkTheme = ThemeData.dark().copyWith(
  colorScheme: ThemeData.dark().colorScheme.copyWith(
    primary: Color(0xFF252525),
    onPrimary: Colors.white,
    secondary: Color(0xFFFF4A4A),
    onSecondary: Colors.white,
    error: Color(0xFFD32F2F),
    surface: Color(0xFF1C1C1C),
    background: Color(0xFF121212),
  ),
);




