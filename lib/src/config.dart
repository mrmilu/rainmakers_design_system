import 'package:flutter/material.dart';

import 'theme/colors.dart';
import 'theme/text_styles.dart';
import 'theme/theme_data.dart';

class RMConfig {
  final RMColors colors;
  final RMTextStyles typography;
  final RMThemeData themeData;

  RMConfig({RMColors? colors, TextTheme? textTheme, RMThemeData? themeData})
    : colors = colors ?? RMColors(),
      typography = textTheme != null
          ? RMTextStyles.fromTextTheme(textTheme)
          : const RMTextStyles(),
      themeData = themeData ?? RMThemeData.fromConfigured() {
    // Configurar automáticamente los colores y tipografía primero
    RMColors.configure(this.colors);
    RMTextStyles.configure(typography);

    // Si no se proporciona themeData, regenerar con los nuevos colores
    if (themeData == null) {
      RMThemeData.regenerate();
    } else {
      RMThemeData.configure(this.themeData);
    }
  }

  // Factory method para configuración más explícita
  factory RMConfig.configure({
    RMColors? colors,
    TextTheme? textTheme,
    RMThemeData? themeData,
  }) {
    return RMConfig(colors: colors, textTheme: textTheme, themeData: themeData);
  }

  // Factory method especializado para configurar desde un TextTheme existente
  factory RMConfig.fromTextTheme({
    TextTheme? textTheme,
    RMColors? colors,
    RMThemeData? themeData,
  }) {
    return RMConfig(colors: colors, textTheme: textTheme, themeData: themeData);
  }

  // Method para reconfigurar después de la creación
  void apply() {
    RMColors.configure(colors);
    RMTextStyles.configure(typography);
    // Regenerar tema si no es uno personalizado
    RMThemeData.regenerate();
  }

  // Getters estáticos para acceso conveniente
  static ThemeData get lightTheme => RMThemeData.light;
  static ThemeData get darkTheme => RMThemeData.dark;
  static ThemeData get theme => RMThemeData.light;
}
