import 'package:flutter/material.dart';

class RMTextStyles {
  final TextStyle displayLarge;
  final TextStyle displayMedium;
  final TextStyle displaySmall;
  final TextStyle headlineLarge;
  final TextStyle headlineMedium;
  final TextStyle headlineSmall;
  final TextStyle titleLarge;
  final TextStyle titleMedium;
  final TextStyle titleSmall;
  final TextStyle bodyLarge;
  final TextStyle bodyMedium;
  final TextStyle bodySmall;
  final TextStyle labelLarge;
  final TextStyle labelMedium;
  final TextStyle labelSmall;

  const RMTextStyles({
    this.displayLarge = const TextStyle(
      fontSize: 57,
      fontWeight: FontWeight.bold,
    ),
    this.displayMedium = const TextStyle(
      fontSize: 45,
      fontWeight: FontWeight.bold,
    ),
    this.displaySmall = const TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.bold,
    ),
    this.headlineLarge = const TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
    ),
    this.headlineMedium = const TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w600,
    ),
    this.headlineSmall = const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
    ),
    this.titleLarge = const TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w500,
    ),
    this.titleMedium = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    this.titleSmall = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    this.bodyLarge = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
    this.bodyMedium = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
    this.bodySmall = const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
    ),
    this.labelLarge = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    this.labelMedium = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
    this.labelSmall = const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
    ),
  });

  // Instancia global configurable
  static RMTextStyles _instance = const RMTextStyles();

  // Getter estático para acceso a la instancia global
  static RMTextStyles get instance => _instance;

  // Método para configurar la tipografía globalmente
  static void configure(RMTextStyles typography) {
    _instance = typography;
  }

  static TextTheme get textTheme {
    return TextTheme(
      displayLarge: displayLargeStyle,
      displayMedium: displayMediumStyle,
      displaySmall: displaySmallStyle,
      headlineLarge: headlineLargeStyle,
      headlineMedium: headlineMediumStyle,
      headlineSmall: headlineSmallStyle,
      titleLarge: titleLargeStyle,
      titleMedium: titleMediumStyle,
      titleSmall: titleSmallStyle,
      bodyLarge: bodyLargeStyle,
      bodyMedium: bodyMediumStyle,
      bodySmall: bodySmallStyle,
      labelLarge: labelLargeStyle,
      labelMedium: labelMediumStyle,
      labelSmall: labelSmallStyle,
    );
  }

  // Getters estáticos que usan la instancia global
  static TextStyle get displayLargeStyle => instance.displayLarge;
  static TextStyle get displayMediumStyle => instance.displayMedium;
  static TextStyle get displaySmallStyle => instance.displaySmall;
  static TextStyle get headlineLargeStyle => instance.headlineLarge;
  static TextStyle get headlineMediumStyle => instance.headlineMedium;
  static TextStyle get headlineSmallStyle => instance.headlineSmall;
  static TextStyle get titleLargeStyle => instance.titleLarge;
  static TextStyle get titleMediumStyle => instance.titleMedium;
  static TextStyle get titleSmallStyle => instance.titleSmall;
  static TextStyle get bodyLargeStyle => instance.bodyLarge;
  static TextStyle get bodyMediumStyle => instance.bodyMedium;
  static TextStyle get bodySmallStyle => instance.bodySmall;
  static TextStyle get labelLargeStyle => instance.labelLarge;
  static TextStyle get labelMediumStyle => instance.labelMedium;
  static TextStyle get labelSmallStyle => instance.labelSmall;
}
