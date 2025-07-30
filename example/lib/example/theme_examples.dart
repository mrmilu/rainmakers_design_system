/// Ejemplos de uso de los temas predefinidos del design system
///
/// Este archivo muestra cómo usar los 3 tipos de temas disponibles
library;

import 'package:flutter/material.dart';
import 'package:rainmakers_design_system/rainmakers_design_system.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // =============================================================================
    // 🎨 EJEMPLO 1: Uso directo de temas predefinidos
    // =============================================================================

    return MaterialApp(
      title: 'Design System Themes Demo',

      // Usar tema moderno directamente
      theme: RMThemeData.modern().lightTheme,
      darkTheme: RMThemeData.modern().darkTheme,
      themeMode: ThemeMode.system,

      home: ThemeShowcaseScreen(),
    );
  }
}

class MyAppWithGlobalTheme extends StatelessWidget {
  const MyAppWithGlobalTheme({super.key});

  @override
  Widget build(BuildContext context) {
    // =============================================================================
    // 🎨 EJEMPLO 2: Configuración global de tema
    // =============================================================================

    // Configurar tema globalmente al inicio de la app
    RMThemeData.useModernTheme(); // o useMinimalTheme() o useCorporateTheme()

    return MaterialApp(
      title: 'Design System Global Theme Demo',

      // Usar tema configurado globalmente
      theme: RMThemeData.light,
      darkTheme: RMThemeData.dark,
      themeMode: ThemeMode.system,

      home: ThemeShowcaseScreen(),
    );
  }
}

class MyAppWithThemeSelector extends StatefulWidget {
  const MyAppWithThemeSelector({super.key});

  @override
  State<MyAppWithThemeSelector> createState() => _MyAppWithThemeSelectorState();
}

class _MyAppWithThemeSelectorState extends State<MyAppWithThemeSelector> {
  RMThemeType _currentTheme = RMThemeType.modern;

  @override
  Widget build(BuildContext context) {
    // =============================================================================
    // 🎨 EJEMPLO 3: Selector dinámico de temas
    // =============================================================================

    // Obtener el tema según la selección actual
    RMThemeData themeData;
    switch (_currentTheme) {
      case RMThemeType.modern:
        themeData = RMThemeData.modern();
        break;
      case RMThemeType.minimal:
        themeData = RMThemeData.minimal();
        break;
      case RMThemeType.corporate:
        themeData = RMThemeData.corporate();
      case RMThemeType.special:
        themeData = RMThemeData.special();
        break;
    }

    return MaterialApp(
      title: 'Design System Theme Selector Demo',
      theme: themeData.lightTheme,
      darkTheme: themeData.darkTheme,
      themeMode: ThemeMode.system,
      home: ThemeSelectorScreen(
        currentTheme: _currentTheme,
        onThemeChanged: (theme) {
          setState(() {
            _currentTheme = theme;
          });
        },
      ),
    );
  }
}

// =============================================================================
// 🖼️ PANTALLAS DE DEMOSTRACIÓN
// =============================================================================

class ThemeShowcaseScreen extends StatelessWidget {
  const ThemeShowcaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Theme Showcase')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Texto con diferentes estilos
            RMText.displayMedium('Design System Themes'),
            SizedBox(height: 8),
            RMText.bodyLarge('Estos son los 3 temas predefinidos disponibles:'),
            SizedBox(height: 24),

            // Botones con diferentes estilos
            RMElevatedButton.primary(label: 'Botón Primario', onPressed: () {}),
            SizedBox(height: 16),

            RMTextButton.primary(label: 'Botón de Texto', onPressed: () {}),
            SizedBox(height: 16),

            // Card de ejemplo
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    RMText.titleLarge('Card de Ejemplo'),
                    SizedBox(height: 8),
                    RMText.bodyMedium(
                      'Este card muestra cómo se ve el tema actual.',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),

            // Widget con icono
            RMRowIconTextWidget.info('Información del tema actual'),
          ],
        ),
      ),
    );
  }
}

class ThemeSelectorScreen extends StatelessWidget {
  final RMThemeType currentTheme;
  final ValueChanged<RMThemeType> onThemeChanged;

  const ThemeSelectorScreen({
    super.key,
    required this.currentTheme,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Selector de Temas')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RMText.displayMedium('Selecciona un Tema'),
            SizedBox(height: 24),

            // Selector de tema moderno
            _buildThemeOption(
              context,
              RMThemeType.modern,
              '🌟 Moderno',
              'Esquinas redondeadas y colores vibrantes. Ideal para apps de consumo y startups.',
            ),

            // Selector de tema minimalista
            _buildThemeOption(
              context,
              RMThemeType.minimal,
              '✨ Minimalista',
              'Líneas limpias y espacios amplios. Ideal para apps de productividad y portfolios.',
            ),

            // Selector de tema corporativo
            _buildThemeOption(
              context,
              RMThemeType.corporate,
              '💼 Corporativo',
              'Estilo profesional y conservador. Ideal para apps empresariales y fintech.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeOption(
    BuildContext context,
    RMThemeType theme,
    String title,
    String description,
  ) {
    final isSelected = currentTheme == theme;

    return Card(
      child: ListTile(
        leading: Radio<RMThemeType>(
          value: theme,
          groupValue: currentTheme,
          onChanged: (value) => onThemeChanged(value!),
        ),
        title: RMText.titleMedium(title),
        subtitle: RMText.bodySmall(description),
        selected: isSelected,
        onTap: () => onThemeChanged(theme),
      ),
    );
  }
}
