import 'package:flutter/material.dart';
import 'colors.dart';
import 'text_styles.dart';

class RMThemeData {
  final ThemeData lightTheme;
  final ThemeData darkTheme;

  const RMThemeData({required this.lightTheme, required this.darkTheme});

  // Constructor con valores por defecto que construye temas automáticamente
  factory RMThemeData.defaultTheme() {
    return RMThemeData(
      lightTheme: _buildDefaultTheme(false),
      darkTheme: _buildDefaultTheme(true),
    );
  }

  // Factory que construye el tema usando los colores configurados actualmente
  factory RMThemeData.fromConfigured() {
    return RMThemeData(
      lightTheme: _buildDefaultTheme(false),
      darkTheme: _buildDefaultTheme(true),
    );
  }

  // Método estático para construir temas por defecto solamente
  static ThemeData _buildDefaultTheme(bool isDark) {
    return ThemeData(
      primaryColor: RMColors.primary,
      colorScheme: ColorScheme.fromSeed(
        seedColor: RMColors.primary,
        secondary: RMColors.secondary,
        surface: RMColors.surface,
        background: isDark ? Colors.grey[900]! : RMColors.background,
        brightness: isDark ? Brightness.dark : Brightness.light,
      ),
      scaffoldBackgroundColor: isDark ? Colors.grey[900] : RMColors.background,
      textTheme: RMTextStyles.textTheme,
      buttonTheme: ButtonThemeData(
        buttonColor: RMColors.primary,
        textTheme: ButtonTextTheme.primary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(
            RMColors.specificContentHigh,
          ),
          backgroundColor: WidgetStateProperty.all(RMColors.primary),
          textStyle: WidgetStateProperty.all(RMTextStyles.bodyLargeStyle),
        ),
      ),
    );
  }

  // Instancia global configurable - inicializar como null para lazy loading
  static RMThemeData? _instance;

  // Getter estático para acceso a la instancia global con lazy loading
  static RMThemeData get instance {
    _instance ??= RMThemeData.fromConfigured();
    return _instance!;
  }

  // Método para configurar el tema globalmente
  static void configure(RMThemeData themeData) {
    _instance = themeData;
  }

  // Método para regenerar el tema usando colores configurados
  static void regenerate() {
    _instance = RMThemeData.fromConfigured();
  }

  // Getters estáticos que usan la instancia global
  static ThemeData get light => instance.lightTheme;
  static ThemeData get dark => instance.darkTheme;

  // Métodos legacy para compatibilidad
  static ThemeData getTheme({ThemeMode? themeMode}) {
    return themeMode == ThemeMode.dark ? dark : light;
  }
}
