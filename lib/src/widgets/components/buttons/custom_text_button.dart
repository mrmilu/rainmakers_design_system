import 'package:flutter/material.dart';
import 'package:rainmakers_design_system/src/widgets/widgets.dart';

import '../../../theme/theme.dart';

/// Widget de botón de texto personalizado del design system
///
/// Uso:
/// ```dart
/// RMTextButton.primary(
///   key: Key('my-text-button'),
///   label: 'Mi Botón',
///   onPressed: () {},
/// )
/// ```
class RMTextButton extends StatelessWidget {
  /// Estilo del botón
  final RMTextButtonStyle _style;

  /// Texto del botón
  final String label;

  /// Función que se ejecuta al presionar el botón
  final VoidCallback? onPressed;

  /// Si el botón está habilitado
  final bool enabled;

  /// Estilo de texto personalizado
  final TextStyle? textStyle;

  /// Color del texto personalizado
  final Color? colorText;

  /// Ruta del icono (solo para estilo icon)
  final String? iconPath;

  const RMTextButton._({
    super.key,
    required RMTextButtonStyle style,
    required this.label,
    required this.onPressed,
    this.enabled = true,
    this.textStyle,
    this.colorText,
    this.iconPath,
  }) : _style = style;

  /// Crea un botón de texto con estilo primario
  const RMTextButton.primary({
    Key? key,
    required String label,
    required VoidCallback? onPressed,
    bool enabled = true,
    TextStyle? textStyle,
    Color? colorText,
  }) : this._(
         key: key,
         style: RMTextButtonStyle.primary,
         label: label,
         onPressed: onPressed,
         enabled: enabled,
         textStyle: textStyle,
         colorText: colorText,
       );

  /// Crea un botón de texto con icono
  const RMTextButton.icon({
    Key? key,
    required String label,
    required String iconPath,
    required VoidCallback? onPressed,
    bool enabled = true,
    TextStyle? textStyle,
    Color? colorText,
  }) : this._(
         key: key,
         style: RMTextButtonStyle.icon,
         label: label,
         onPressed: onPressed,
         enabled: enabled,
         textStyle: textStyle,
         colorText: colorText,
         iconPath: iconPath,
       );

  @override
  Widget build(BuildContext context) {
    final effectiveOnPressed = enabled ? onPressed : null;

    return TextButton(
      onPressed: effectiveOnPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
        foregroundColor: Colors.black,
        overlayColor: Colors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(child: Text(label, style: _getTextStyle())),
          if (_style == RMTextButtonStyle.icon &&
              iconPath?.isNotEmpty == true) ...[
            const SizedBox(width: 8),
            RMImageAssetWidget(
              path: iconPath!,
              height: 16,
              width: 16,
              color: _getTextColor(),
            ),
          ],
        ],
      ),
    );
  }

  TextStyle _getTextStyle() {
    final baseStyle = textStyle ?? RMTextStyles.bodyMediumStyle;
    return baseStyle.copyWith(color: _getTextColor());
  }

  Color _getTextColor() {
    return enabled ? (colorText ?? Colors.black) : RMColors.disabled;
  }
}

/// Estilos disponibles para RMTextButton
enum RMTextButtonStyle { primary, icon }
