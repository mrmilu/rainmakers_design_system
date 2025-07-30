import 'package:flutter/material.dart';
import 'package:rainmakers_design_system/rainmakers_design_system.dart';

import 'example/components.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  RMThemeType _currentTheme = RMThemeType.modern;

  @override
  Widget build(BuildContext context) {
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
      title: 'Theme Comparison',
      theme: themeData.lightTheme,
      darkTheme: themeData.darkTheme,
      home: ComponentsPage(
        onThemeChanged: (newTheme) {
          setState(() {
            _currentTheme = newTheme;
          });
        },
      ),
    );
  }
}
