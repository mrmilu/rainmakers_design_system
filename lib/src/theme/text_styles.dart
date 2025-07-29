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

  // Factory para crear RMTextStyles desde un TextTheme existente
  static RMTextStyles fromTextTheme(TextTheme textTheme) {
    const defaultStyles = RMTextStyles();

    return RMTextStyles(
      displayLarge: textTheme.displayLarge ?? defaultStyles.displayLarge,
      displayMedium: textTheme.displayMedium ?? defaultStyles.displayMedium,
      displaySmall: textTheme.displaySmall ?? defaultStyles.displaySmall,
      headlineLarge: textTheme.headlineLarge ?? defaultStyles.headlineLarge,
      headlineMedium: textTheme.headlineMedium ?? defaultStyles.headlineMedium,
      headlineSmall: textTheme.headlineSmall ?? defaultStyles.headlineSmall,
      titleLarge: textTheme.titleLarge ?? defaultStyles.titleLarge,
      titleMedium: textTheme.titleMedium ?? defaultStyles.titleMedium,
      titleSmall: textTheme.titleSmall ?? defaultStyles.titleSmall,
      bodyLarge: textTheme.bodyLarge ?? defaultStyles.bodyLarge,
      bodyMedium: textTheme.bodyMedium ?? defaultStyles.bodyMedium,
      bodySmall: textTheme.bodySmall ?? defaultStyles.bodySmall,
      labelLarge: textTheme.labelLarge ?? defaultStyles.labelLarge,
      labelMedium: textTheme.labelMedium ?? defaultStyles.labelMedium,
      labelSmall: textTheme.labelSmall ?? defaultStyles.labelSmall,
    );
  }

  static TextTheme get textTheme {
    return TextTheme(
      displayLarge: _instance.displayLarge,
      displayMedium: _instance.displayMedium,
      displaySmall: _instance.displaySmall,
      headlineLarge: _instance.headlineLarge,
      headlineMedium: _instance.headlineMedium,
      headlineSmall: _instance.headlineSmall,
      titleLarge: _instance.titleLarge,
      titleMedium: _instance.titleMedium,
      titleSmall: _instance.titleSmall,
      bodyLarge: _instance.bodyLarge,
      bodyMedium: _instance.bodyMedium,
      bodySmall: _instance.bodySmall,
      labelLarge: _instance.labelLarge,
      labelMedium: _instance.labelMedium,
      labelSmall: _instance.labelSmall,
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
