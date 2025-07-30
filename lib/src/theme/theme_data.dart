import 'package:flutter/material.dart';
import 'package:rainmakers_design_system/src/utils/utils.dart';

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

  /// Tema especial para casos únicos con efectos llamativos
  special,
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

  /// Tema especial para casos únicos con efectos llamativos
  /// Ideal para apps de gaming, eventos, presentaciones, demos
  factory RMThemeData.special() {
    return RMThemeData(
      lightTheme: _buildTheme(RMThemeType.special, false),
      darkTheme: _buildTheme(RMThemeType.special, true),
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
      case RMThemeType.special:
        return _buildSpecialTheme(colorScheme, scaffoldBackground, isDark);
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
      useMaterial3: true,

      // Botones con esquinas muy redondeadas y efectos modernos
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(
            RMColors.specificContentHigh,
          ),
          backgroundColor: WidgetStateProperty.all(RMColors.primary),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
          elevation: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.pressed)) return 12;
            if (states.contains(WidgetState.hovered)) return 8;
            return 4;
          }),
          textStyle: WidgetStateProperty.all(
            RMTextStyles.labelLargeStyle.copyWith(fontWeight: FontWeight.w600),
          ),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
          ),
          shadowColor: WidgetStateProperty.all(RMColors.primary.wOpacity(0.3)),
        ),
      ),

      // Text buttons modernos
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(RMColors.primary),
          textStyle: WidgetStateProperty.all(
            RMTextStyles.labelMediumStyle.copyWith(fontWeight: FontWeight.w600),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          ),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
        ),
      ),

      // Outlined buttons modernos
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(RMColors.primary),
          side: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.pressed)) {
              return BorderSide(color: RMColors.primary, width: 2.5);
            }
            return BorderSide(color: RMColors.primary, width: 2);
          }),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          ),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          ),
        ),
      ),

      // Cards con esquinas muy redondeadas y sombra elegante
      cardTheme: CardThemeData(
        elevation: 6,
        shadowColor: Colors.black.wOpacity(0.15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        margin: const EdgeInsets.all(8),
      ),

      // Input fields modernos con efectos
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.grey[400]!, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.grey[400]!, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: RMColors.primary, width: 2.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.red[400]!, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        filled: true,
        fillColor: isDark ? Colors.grey[800]!.wOpacity(0.3) : Colors.grey[50],
      ),

      // AppBar moderno
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: scaffoldBackground,
        foregroundColor: isDark ? Colors.white : Colors.black87,
        titleTextStyle: RMTextStyles.headlineSmallStyle.copyWith(
          color: isDark ? Colors.white : Colors.black87,
          fontWeight: FontWeight.w700,
        ),
        centerTitle: true,
      ),

      // FloatingActionButton moderno
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: 8,
        highlightElevation: 12,
        backgroundColor: RMColors.primary,
        foregroundColor: RMColors.specificContentHigh,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),

      // Dividers modernos
      dividerTheme: DividerThemeData(
        thickness: 1,
        color: isDark ? Colors.grey[700] : Colors.grey[300],
        space: 20,
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
      useMaterial3: true,

      // Botones minimalistas con líneas limpias
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(
            RMColors.specificContentHigh,
          ),
          backgroundColor: WidgetStateProperty.all(RMColors.primary),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          ),
          elevation: WidgetStateProperty.all(0),
          textStyle: WidgetStateProperty.all(
            RMTextStyles.labelMediumStyle.copyWith(
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
            ),
          ),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          ),
          overlayColor: WidgetStateProperty.all(Colors.white.wOpacity(0.1)),
        ),
      ),

      // Text buttons minimalistas
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(RMColors.primary),
          textStyle: WidgetStateProperty.all(
            RMTextStyles.labelMediumStyle.copyWith(
              fontWeight: FontWeight.w400,
              letterSpacing: 0.3,
            ),
          ),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          ),
          overlayColor: WidgetStateProperty.all(
            RMColors.primary.wOpacity(0.04),
          ),
        ),
      ),

      // Outlined buttons minimalistas
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(RMColors.primary),
          side: WidgetStateProperty.all(
            BorderSide(color: RMColors.primary, width: 1),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          ),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
          ),
          overlayColor: WidgetStateProperty.all(
            RMColors.primary.wOpacity(0.04),
          ),
        ),
      ),

      // Cards planas sin sombra con bordes sutiles
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: isDark ? Colors.grey[700]! : Colors.grey[200]!,
            width: 1,
          ),
        ),
        margin: const EdgeInsets.all(4),
        color: scaffoldBackground,
      ),

      // Input fields minimalistas con bordes sutiles
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey[400]!, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey[400]!, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: RMColors.primary, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.red[400]!, width: 1),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20,
        ),
        filled: false,
      ),

      // AppBar minimalista
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: scaffoldBackground,
        foregroundColor: isDark ? Colors.white : Colors.black87,
        titleTextStyle: RMTextStyles.headlineSmallStyle.copyWith(
          color: isDark ? Colors.white : Colors.black87,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
        ),
        centerTitle: false,
      ),

      // FloatingActionButton minimalista
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: 2,
        highlightElevation: 4,
        backgroundColor: RMColors.primary,
        foregroundColor: RMColors.specificContentHigh,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),

      // Dividers minimalistas
      dividerTheme: DividerThemeData(
        thickness: 1,
        color: isDark ? Colors.grey[800] : Colors.grey[200],
        space: 32,
      ),

      // ListTile minimalista
      listTileTheme: ListTileThemeData(
        contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        minLeadingWidth: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
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
      useMaterial3: true,

      // Botones corporativos tradicionales y robustos
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(
            RMColors.specificContentHigh,
          ),
          backgroundColor: WidgetStateProperty.all(RMColors.primary),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          ),
          elevation: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.pressed)) return 2;
            return 1;
          }),
          textStyle: WidgetStateProperty.all(
            RMTextStyles.labelMediumStyle.copyWith(
              fontWeight: FontWeight.w700,
              letterSpacing: 0.8,
            ),
          ),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          ),
          shadowColor: WidgetStateProperty.all(Colors.black.wOpacity(0.2)),
        ),
      ),

      // Text buttons corporativos
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(RMColors.primary),
          textStyle: WidgetStateProperty.all(
            RMTextStyles.labelMediumStyle.copyWith(
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          ),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
        ),
      ),

      // Outlined buttons corporativos
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(RMColors.primary),
          side: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.pressed)) {
              return BorderSide(color: RMColors.primary, width: 2);
            }
            return BorderSide(color: RMColors.primary, width: 1.5);
          }),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          ),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
          ),
        ),
      ),

      // Cards corporativas con sombra profesional
      cardTheme: CardThemeData(
        elevation: 2,
        shadowColor: Colors.black.wOpacity(0.1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        margin: const EdgeInsets.all(4),
        color: isDark ? Colors.grey[850] : Colors.white,
      ),

      // Input fields corporativos robustos
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: Colors.grey[500]!, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: Colors.grey[500]!, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: RMColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: Colors.red[600]!, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        filled: true,
        fillColor: isDark ? Colors.grey[900]!.wOpacity(0.3) : Colors.grey[50],
      ),

      // AppBar corporativo profesional
      appBarTheme: AppBarTheme(
        elevation: 1,
        backgroundColor: isDark ? Colors.grey[900] : Colors.white,
        foregroundColor: isDark ? Colors.white : Colors.black87,
        shadowColor: Colors.black.wOpacity(0.1),
        titleTextStyle: RMTextStyles.headlineSmallStyle.copyWith(
          color: isDark ? Colors.white : Colors.black87,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.3,
        ),
        centerTitle: false,
      ),

      // FloatingActionButton corporativo
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: 3,
        highlightElevation: 6,
        backgroundColor: RMColors.primary,
        foregroundColor: RMColors.specificContentHigh,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),

      // Dividers corporativos
      dividerTheme: DividerThemeData(
        thickness: 1.5,
        color: isDark ? Colors.grey[600] : Colors.grey[400],
        space: 16,
      ),

      // ListTile corporativo
      listTileTheme: ListTileThemeData(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        minLeadingWidth: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        tileColor: isDark ? Colors.grey[900] : Colors.white,
      ),

      // Data table corporativo
      dataTableTheme: DataTableThemeData(
        columnSpacing: 24,
        horizontalMargin: 16,
        decoration: BoxDecoration(
          border: Border.all(
            color: isDark ? Colors.grey[700]! : Colors.grey[300]!,
            width: 1,
          ),
        ),
      ),
    );
  }

  /// Construye el tema especial para casos únicos con efectos llamativos
  static ThemeData _buildSpecialTheme(
    ColorScheme colorScheme,
    Color scaffoldBackground,
    bool isDark,
  ) {
    return ThemeData(
      primaryColor: RMColors.primary,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: scaffoldBackground,
      textTheme: RMTextStyles.textTheme,
      useMaterial3: true,

      // Botones especiales con efectos dramáticos
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(
            RMColors.specificContentHigh,
          ),
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.pressed)) {
              return RMColors.primary.wOpacity(0.8);
            }
            if (states.contains(WidgetState.hovered)) {
              return RMColors.primary.wOpacity(0.9);
            }
            return RMColors.primary;
          }),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          ),
          elevation: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.pressed)) return 20;
            if (states.contains(WidgetState.hovered)) return 15;
            return 10;
          }),
          textStyle: WidgetStateProperty.all(
            RMTextStyles.labelLargeStyle.copyWith(
              fontWeight: FontWeight.w800,
              letterSpacing: 1.2,
            ),
          ),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
          ),
          shadowColor: WidgetStateProperty.all(RMColors.primary.wOpacity(0.5)),
          side: WidgetStateProperty.all(
            BorderSide(color: Colors.white.wOpacity(0.3), width: 1),
          ),
        ),
      ),

      // Text buttons especiales con efectos de brillo
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.hovered)) {
              return RMColors.primary.wOpacity(0.8);
            }
            return RMColors.primary;
          }),
          textStyle: WidgetStateProperty.all(
            RMTextStyles.labelMediumStyle.copyWith(
              fontWeight: FontWeight.w700,
              letterSpacing: 1.0,
            ),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          ),
          overlayColor: WidgetStateProperty.all(RMColors.primary.wOpacity(0.1)),
        ),
      ),

      // Outlined buttons especiales con gradientes
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(RMColors.primary),
          side: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.pressed)) {
              return BorderSide(color: RMColors.primary, width: 3);
            }
            if (states.contains(WidgetState.hovered)) {
              return BorderSide(
                color: RMColors.primary.wOpacity(0.8),
                width: 2.5,
              );
            }
            return BorderSide(color: RMColors.primary, width: 2);
          }),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
          ),
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.hovered)) {
              return RMColors.primary.wOpacity(0.05);
            }
            return Colors.transparent;
          }),
        ),
      ),

      // Cards especiales con efectos dramáticos
      cardTheme: CardThemeData(
        elevation: 12,
        shadowColor: RMColors.primary.wOpacity(0.2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        margin: const EdgeInsets.all(12),
        color: isDark
            ? Colors.grey[800]!.wOpacity(0.9)
            : Colors.white.wOpacity(0.95),
      ),

      // Input fields especiales con efectos de glow
      inputDecorationTheme: InputDecorationTheme(),

      // AppBar especial con efectos
      appBarTheme: AppBarTheme(
        elevation: 8,
        backgroundColor: isDark
            ? Colors.grey[900]!.wOpacity(0.95)
            : Colors.white.wOpacity(0.95),
        foregroundColor: isDark ? Colors.white : Colors.black87,
        shadowColor: RMColors.primary.wOpacity(0.3),
        titleTextStyle: RMTextStyles.headlineSmallStyle.copyWith(
          color: isDark ? Colors.white : Colors.black87,
          fontWeight: FontWeight.w900,
          letterSpacing: 1.5,
        ),
        centerTitle: true,
      ),

      // FloatingActionButton especial con efectos dramáticos
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: 15,
        highlightElevation: 25,
        backgroundColor: RMColors.primary,
        foregroundColor: RMColors.specificContentHigh,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),

      // Dividers especiales con efectos
      dividerTheme: DividerThemeData(
        thickness: 2,
        color: RMColors.primary.wOpacity(0.3),
        space: 24,
      ),

      // ListTile especial
      listTileTheme: ListTileThemeData(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        ),
        minLeadingWidth: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        tileColor: isDark
            ? Colors.grey[800]!.wOpacity(0.3)
            : Colors.grey[50]!.wOpacity(0.5),
      ),

      // BottomNavigationBar especial
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 12,
        backgroundColor: isDark ? Colors.grey[900] : Colors.white,
        selectedItemColor: RMColors.primary,
        unselectedItemColor: Colors.grey[500],
        selectedLabelStyle: RMTextStyles.labelSmallStyle.copyWith(
          fontWeight: FontWeight.w700,
        ),
        unselectedLabelStyle: RMTextStyles.labelSmallStyle.copyWith(
          fontWeight: FontWeight.w400,
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

  /// Configura globalmente el tema especial
  static void useSpecialTheme() {
    configure(RMThemeData.special());
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
      case RMThemeType.special:
        useSpecialTheme();
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
