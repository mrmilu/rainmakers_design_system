/// Comparación visual de los 3 temas predefinidos
///
/// Este archivo muestra lado a lado las diferencias entre los temas
library;

import 'package:flutter/material.dart';
import 'package:rainmakers_design_system/rainmakers_design_system.dart';

void main() {
  runApp(ThemeComparisonApp());
}

class ThemeComparisonApp extends StatelessWidget {
  const ThemeComparisonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Theme Comparison',
      theme: ThemeData.light(),
      home: ThemeComparisonScreen(),
    );
  }
}

class ThemeComparisonScreen extends StatelessWidget {
  const ThemeComparisonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comparación de Temas del Design System'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Título
            Text(
              '3 Temas Predefinidos Disponibles',
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),

            // Comparación en fila
            Row(
              children: [
                // Tema Moderno
                Expanded(
                  child: _buildThemePreview(
                    title: '🌟 Moderno',
                    description: 'Apps de consumo\nStartups\nCreativas',
                    themeData: RMThemeData.modern(),
                    characteristics: [
                      'BorderRadius: 12px',
                      'Elevación: 2-8px',
                      'Colores vibrantes',
                      'Efectos modernos',
                    ],
                  ),
                ),
                SizedBox(width: 16),

                // Tema Minimalista
                Expanded(
                  child: _buildThemePreview(
                    title: '✨ Minimalista',
                    description: 'Productividad\nPortfolios\nBlogs',
                    themeData: RMThemeData.minimal(),
                    characteristics: [
                      'BorderRadius: 4px',
                      'Elevación: 0px',
                      'Bordes sutiles',
                      'Espacios amplios',
                    ],
                  ),
                ),
                SizedBox(width: 16),

                // Tema Corporativo
                Expanded(
                  child: _buildThemePreview(
                    title: '💼 Corporativo',
                    description: 'Empresarial\nFintech\nNegocios',
                    themeData: RMThemeData.corporate(),
                    characteristics: [
                      'BorderRadius: 2px',
                      'Elevación: 1px',
                      'Estilo profesional',
                      'Tipografía bold',
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 32),

            // Ejemplos de código
            _buildCodeExamples(),
          ],
        ),
      ),
    );
  }

  Widget _buildThemePreview({
    required String title,
    required String description,
    required RMThemeData themeData,
    required List<String> characteristics,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título del tema
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),

          // Descripción de uso
          Text(
            description,
            style: TextStyle(fontSize: 12, color: Colors.grey[600]),
          ),
          SizedBox(height: 16),

          // Preview del tema
          Theme(
            data: themeData.lightTheme,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Botón de ejemplo
                ElevatedButton(onPressed: () {}, child: Text('Botón')),
                SizedBox(height: 8),

                // Card de ejemplo
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Text(
                          'Card Ejemplo',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Contenido de la card',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 16),

          // Características
          Text(
            'Características:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
          SizedBox(height: 4),
          ...characteristics.map(
            (char) => Padding(
              padding: EdgeInsets.only(left: 8, bottom: 2),
              child: Row(
                children: [
                  Icon(Icons.circle, size: 4, color: Colors.grey),
                  SizedBox(width: 6),
                  Expanded(child: Text(char, style: TextStyle(fontSize: 10))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCodeExamples() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '💻 Ejemplos de Código',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),

          // Uso directo
          _buildCodeSection('1. Uso Directo', '''MaterialApp(
  theme: RMThemeData.modern().lightTheme,
  darkTheme: RMThemeData.modern().darkTheme,
  home: MyHomePage(),
)'''),

          // Configuración global
          _buildCodeSection('2. Configuración Global', '''// Al inicio de tu app
RMThemeData.useModernTheme();
// o RMThemeData.useMinimalTheme();
// o RMThemeData.useCorporateTheme();

MaterialApp(
  theme: RMThemeData.light,
  darkTheme: RMThemeData.dark,
  home: MyHomePage(),
)'''),

          // Selector dinámico
          _buildCodeSection(
            '3. Cambio Dinámico',
            '''RMThemeType currentTheme = RMThemeType.modern;

// Cambiar tema
RMThemeData.useThemeType(currentTheme);

// O usando switch
switch (currentTheme) {
  case RMThemeType.modern:
    return RMThemeData.modern();
  case RMThemeType.minimal:
    return RMThemeData.minimal();
  case RMThemeType.corporate:
    return RMThemeData.corporate();
}''',
          ),
        ],
      ),
    );
  }

  Widget _buildCodeSection(String title, String code) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue[700],
            ),
          ),
          SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              code,
              style: TextStyle(
                fontFamily: 'monospace',
                fontSize: 12,
                color: Colors.green[300],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
