import 'package:flutter/material.dart';

class RMColors {
  // Primaries
  final Color primaryColor;
  final Color secondaryColor;
  final Color tertiaryColor;
  // Backgrounds
  final Color backgroundColor;
  final Color onBackgroundColor;
  // Surfaces
  final Color surfaceColor;
  // Basic
  final Color specificBasicBlackColor;
  final Color specificBasicSemiBlackColor;
  final Color specificBasicWhiteColor;
  final Color specificBasicGreyColor;
  // Content
  final Color specificContentHighColor;
  final Color specificContentMidColor;
  final Color specificContentLowColor;
  final Color specificContentExtraLowColor;
  // Border
  final Color specificBorderMidColor;
  final Color specificBorderLowColor;
  // Semantic
  final Color specificSemanticErrorColor;
  final Color specificSemanticWarningColor;
  final Color specificSemanticSuccessColor;
  final Color specificSemanticInfoColor;

  const RMColors({
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.green,
    this.tertiaryColor = Colors.orange,
    this.backgroundColor = Colors.white,
    this.onBackgroundColor = Colors.black,
    this.surfaceColor = const Color(0xFFF5F5F5),
    this.specificBasicBlackColor = const Color(0xff000000),
    this.specificBasicSemiBlackColor = const Color(0xFF676767),
    this.specificBasicWhiteColor = const Color(0xffFFFFFF),
    this.specificBasicGreyColor = const Color(0xFFDADADA),
    this.specificContentHighColor = const Color(0xff322D2A),
    this.specificContentMidColor = const Color(0xff7D7A78),
    this.specificContentLowColor = const Color(0xff96969A),
    this.specificContentExtraLowColor = const Color(0xffBDBDBD),
    this.specificBorderMidColor = const Color(0xffC6C6CE),
    this.specificBorderLowColor = const Color(0xffDDDDE2),
    this.specificSemanticErrorColor = const Color(0xFFD92D20),
    this.specificSemanticWarningColor = const Color(0xFFC35605),
    this.specificSemanticSuccessColor = const Color(0xFF288240),
    this.specificSemanticInfoColor = const Color(0xff1976D2),
  });

  // Instancia global configurable
  static RMColors _instance = const RMColors();

  // Getter estático para acceso a la instancia global
  static RMColors get instance => _instance;

  // Método para configurar los colores globalmente
  static void configure(RMColors colors) {
    _instance = colors;
  }

  // Getters estáticos que usan la instancia global
  static Color get primary => _instance.primaryColor;
  static Color get secondary => _instance.secondaryColor;
  static Color get tertiary => _instance.tertiaryColor;
  static Color get background => _instance.backgroundColor;
  static Color get onBackground => _instance.onBackgroundColor;
  static Color get surface => _instance.surfaceColor;
  static Color get specificBasicBlack => _instance.specificBasicBlackColor;
  static Color get specificBasicSemiBlack =>
      _instance.specificBasicSemiBlackColor;
  static Color get specificBasicWhite => _instance.specificBasicWhiteColor;
  static Color get specificBasicGrey => _instance.specificBasicGreyColor;
  static Color get specificContentHigh => _instance.specificContentHighColor;
  static Color get specificContentMid => _instance.specificContentMidColor;
  static Color get specificContentLow => _instance.specificContentLowColor;
  static Color get specificContentExtraLow =>
      _instance.specificContentExtraLowColor;
  static Color get specificBorderMid => _instance.specificBorderMidColor;
  static Color get specificBorderLow => _instance.specificBorderLowColor;
  static Color get specificSemanticError =>
      _instance.specificSemanticErrorColor;
  static Color get specificSemanticWarning =>
      _instance.specificSemanticWarningColor;
  static Color get specificSemanticSuccess =>
      _instance.specificSemanticSuccessColor;
  static Color get specificSemanticInfo => _instance.specificSemanticInfoColor;
}
