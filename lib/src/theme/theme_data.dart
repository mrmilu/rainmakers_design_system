import 'package:flutter/material.dart';

import 'colors.dart';
import 'text_styles.dart';

/// Tipos de temas predefinidos disponibles en el design system
enum RMThemeType {
  /// Tema moderno con esquinas redondeadas y colores vibrantes
  modern,

  /// Tema minimalista con líneas limpias y espacios amplios
  minimal,

  /// Tema corporativo con estilo profesional y conservador
  corporate,
}

class RMThemeData {
  final ThemeData lightTheme;
  final ThemeData darkTheme;

  const RMThemeData({required this.lightTheme, required this.darkTheme});

  // Constructor con valores por defecto que construye temas automáticamente
  factory RMThemeData.defaultTheme() {
    return RMThemeData(
      lightTheme: _buildTheme(RMThemeType.modern, false),
      darkTheme: _buildTheme(RMThemeType.modern, true),
    );
  }

  // Factory que construye el tema usando los colores configurados actualmente
  factory RMThemeData.fromConfigured() {
    return RMThemeData(
      lightTheme: _buildTheme(RMThemeType.modern, false),
      darkTheme: _buildTheme(RMThemeType.modern, true),
    );
  }

  // =============================================================================
  // 🎨 TEMAS PREDEFINIDOS
  // =============================================================================

  /// Tema moderno con esquinas redondeadas y colores vibrantes
  /// Ideal para apps de consumo, startups, aplicaciones creativas
  factory RMThemeData.modern() {
    return RMThemeData(
      lightTheme: _buildTheme(RMThemeType.modern, false),
      darkTheme: _buildTheme(RMThemeType.modern, true),
    );
  }

  /// Tema minimalista con líneas limpias y espacios amplios
  /// Ideal para apps de productividad, portfolios, blogs
  factory RMThemeData.minimal() {
    return RMThemeData(
      lightTheme: _buildTheme(RMThemeType.minimal, false),
      darkTheme: _buildTheme(RMThemeType.minimal, true),
    );
  }

  /// Tema corporativo con estilo profesional y conservador
  /// Ideal para apps empresariales, fintech, herramientas de negocio
  factory RMThemeData.corporate() {
    return RMThemeData(
      lightTheme: _buildTheme(RMThemeType.corporate, false),
      darkTheme: _buildTheme(RMThemeType.corporate, true),
    );
  }

  // Método estático para construir temas según el tipo especificado
  static ThemeData _buildTheme(RMThemeType themeType, bool isDark) {
    // Configuraciones base comunes
    final ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: RMColors.primary,
      secondary: RMColors.secondary,
      surface: isDark ? Colors.grey[900]! : RMColors.background,
      brightness: isDark ? Brightness.dark : Brightness.light,
    );

    final Color scaffoldBackground = isDark
        ? Colors.grey[900]!
        : RMColors.background;

    // Configuraciones específicas según el tipo de tema
    switch (themeType) {
      case RMThemeType.modern:
        return _buildModernTheme(colorScheme, scaffoldBackground, isDark);
      case RMThemeType.minimal:
        return _buildMinimalTheme(colorScheme, scaffoldBackground, isDark);
      case RMThemeType.corporate:
        return _buildCorporateTheme(colorScheme, scaffoldBackground, isDark);
    }
  }

  // =============================================================================
  // 🎨 CONSTRUCTORES DE TEMAS ESPECÍFICOS
  // =============================================================================

  /// Construye el tema moderno con esquinas redondeadas y elementos vibrantes
  static ThemeData _buildModernTheme(
    ColorScheme colorScheme,
    Color scaffoldBackground,
    bool isDark,
  ) {
    return ThemeData(
      primaryColor: RMColors.primary,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: scaffoldBackground,
      textTheme: RMTextStyles.textTheme,

      // Botones con esquinas muy redondeadas y efectos modernos
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(
            RMColors.specificContentHigh,
          ),
          backgroundColor: WidgetStateProperty.all(RMColors.primary),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          elevation: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.pressed)) return 8;
            if (states.contains(WidgetState.hovered)) return 4;
            return 2;
          }),
          textStyle: WidgetStateProperty.all(RMTextStyles.labelLargeStyle),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          ),
        ),
      ),

      // Cards con esquinas redondeadas
      cardTheme: CardThemeData(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),

      // Input fields modernos
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: RMColors.primary, width: 2),
        ),
      ),
    );
  }

  /// Construye el tema minimalista con líneas limpias y espacios amplios
  static ThemeData _buildMinimalTheme(
    ColorScheme colorScheme,
    Color scaffoldBackground,
    bool isDark,
  ) {
    return ThemeData(
      primaryColor: RMColors.primary,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: scaffoldBackground,
      textTheme: RMTextStyles.textTheme,

      // Botones minimalistas sin decoración excesiva
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(
            RMColors.specificContentHigh,
          ),
          backgroundColor: WidgetStateProperty.all(RMColors.primary),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          ),
          elevation: WidgetStateProperty.all(0),
          textStyle: WidgetStateProperty.all(RMTextStyles.labelMediumStyle),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
          ),
        ),
      ),

      // Cards planas sin sombra
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(
            color: isDark ? Colors.grey[700]! : Colors.grey[300]!,
            width: 1,
          ),
        ),
      ),

      // Input fields minimalistas
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: RMColors.primary, width: 1),
        ),
      ),
    );
  }

  /// Construye el tema corporativo con estilo profesional y conservador
  static ThemeData _buildCorporateTheme(
    ColorScheme colorScheme,
    Color scaffoldBackground,
    bool isDark,
  ) {
    return ThemeData(
      primaryColor: RMColors.primary,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: scaffoldBackground,
      textTheme: RMTextStyles.textTheme,

      // Botones corporativos tradicionales
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(
            RMColors.specificContentHigh,
          ),
          backgroundColor: WidgetStateProperty.all(RMColors.primary),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
          ),
          elevation: WidgetStateProperty.all(1),
          textStyle: WidgetStateProperty.all(
            RMTextStyles.labelMediumStyle.copyWith(fontWeight: FontWeight.w600),
          ),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          ),
        ),
      ),

      // Cards con sombra sutil
      cardTheme: CardThemeData(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
      ),

      // Input fields corporativos
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(2)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2),
          borderSide: BorderSide(color: RMColors.primary, width: 1.5),
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

  // =============================================================================
  // 🎯 MÉTODOS DE CONVENIENCIA PARA TEMAS PREDEFINIDOS
  // =============================================================================

  /// Configura globalmente el tema moderno
  static void useModernTheme() {
    configure(RMThemeData.modern());
  }

  /// Configura globalmente el tema minimalista
  static void useMinimalTheme() {
    configure(RMThemeData.minimal());
  }

  /// Configura globalmente el tema corporativo
  static void useCorporateTheme() {
    configure(RMThemeData.corporate());
  }

  /// Configura globalmente un tema específico por tipo
  static void useThemeType(RMThemeType type) {
    switch (type) {
      case RMThemeType.modern:
        useModernTheme();
        break;
      case RMThemeType.minimal:
        useMinimalTheme();
        break;
      case RMThemeType.corporate:
        useCorporateTheme();
        break;
    }
  }

  // Getters estáticos que usan la instancia global
  static ThemeData get light => instance.lightTheme;
  static ThemeData get dark => instance.darkTheme;

  // Métodos legacy para compatibilidad
  static ThemeData getTheme({ThemeMode? themeMode}) {
    return themeMode == ThemeMode.dark ? dark : light;
  }
}
