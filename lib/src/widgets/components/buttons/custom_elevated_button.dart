import 'package:flutter/material.dart';

import '../../../theme/colors.dart';
import '../../common/button_scale_widget.dart';
import '../../common/image_asset_widget.dart';

/// Widget elevado personalizado del design system
///
/// Uso:
/// ```dart
/// RMElevatedButton.primary(
///   key: Key('my-button'),
///   label: 'Mi Botón',
///   onPressed: () {},
/// )
/// ```
class RMElevatedButton extends StatelessWidget {
  /// Estilo del botón
  final RMElevatedButtonStyle _style;

  /// Texto del botón
  final String label;

  /// Función que se ejecuta al presionar el botón
  final VoidCallback? onPressed;

  /// Color de fondo personalizado
  final Color? backgroundColor;

  /// Color del texto personalizado
  final Color? foregroundColor;

  /// Padding interno del botón
  final EdgeInsets? padding;

  /// Si el botón está deshabilitado
  final bool isDisabled;

  /// Si el botón está en estado de carga
  final bool isLoading;

  /// Ruta del icono (opcional)
  final String? iconPath;

  /// Si el icono va a la derecha del texto
  final bool iconRight;

  /// Alineación del texto
  final TextAlign? textAlign;

  /// Color del icono
  final Color? iconColor;

  const RMElevatedButton._({
    super.key,
    required RMElevatedButtonStyle style,
    required this.label,
    required this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.padding,
    this.isDisabled = false,
    this.isLoading = false,
    this.iconPath,
    this.iconRight = false,
    this.textAlign,
    this.iconColor,
  }) : _style = style;

  /// Crea un botón elevado con estilo primario
  const RMElevatedButton.primary({
    Key? key,
    required String label,
    required VoidCallback? onPressed,
    Color? backgroundColor,
    Color? foregroundColor,
    EdgeInsets? padding,
    bool isDisabled = false,
    bool isLoading = false,
    String? iconPath,
    bool iconRight = false,
    TextAlign? textAlign,
    Color? iconColor,
  }) : this._(
         key: key,
         style: RMElevatedButtonStyle.primary,
         label: label,
         onPressed: onPressed,
         backgroundColor: backgroundColor,
         foregroundColor: foregroundColor,
         padding: padding,
         isDisabled: isDisabled,
         isLoading: isLoading,
         iconPath: iconPath,
         iconRight: iconRight,
         textAlign: textAlign,
         iconColor: iconColor,
       );

  /// Crea un botón elevado con estilo inverso
  const RMElevatedButton.inverse({
    Key? key,
    required String label,
    required VoidCallback? onPressed,
    Color? backgroundColor,
    Color? foregroundColor,
    EdgeInsets? padding,
    bool isDisabled = false,
    bool isLoading = false,
    String? iconPath,
    bool iconRight = false,
    TextAlign? textAlign,
    Color? iconColor,
  }) : this._(
         key: key,
         style: RMElevatedButtonStyle.inverse,
         label: label,
         onPressed: onPressed,
         backgroundColor: backgroundColor,
         foregroundColor: foregroundColor,
         padding: padding,
         isDisabled: isDisabled,
         isLoading: isLoading,
         iconPath: iconPath,
         iconRight: iconRight,
         textAlign: textAlign,
         iconColor: iconColor,
       );

  @override
  Widget build(BuildContext context) {
    final effectiveOnPressed = (isDisabled || isLoading) ? null : onPressed;

    return RMButtonScaleWidget(
      onTap: effectiveOnPressed == null
          ? null
          : () {
              if (isLoading) return;
              effectiveOnPressed();
            },
      child: ElevatedButton(
        onPressed: effectiveOnPressed,
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: RMColors.disabled,
          disabledForegroundColor: Colors.white,
          backgroundColor: _getBackgroundColor(),
          foregroundColor: _getForegroundColor(),
          padding: padding,
        ),
        child: isLoading
            ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: _getForegroundColor(),
                ),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (!iconRight && iconPath != null) ...[
                    RMImageAssetWidget(
                      path: iconPath!,
                      width: 20,
                      height: 20,
                      color: iconColor ?? _getDefaultIconColor(),
                    ),
                    const SizedBox(width: 8),
                  ],
                  Flexible(child: Text(label, textAlign: textAlign)),
                  if (iconRight && iconPath != null) ...[
                    const SizedBox(width: 8),
                    RMImageAssetWidget(
                      path: iconPath!,
                      width: 20,
                      height: 20,
                      color: iconColor ?? _getDefaultIconColor(),
                    ),
                  ],
                ],
              ),
      ),
    );
  }

  Color _getBackgroundColor() {
    if (isDisabled) return RMColors.disabled;
    if (backgroundColor != null) return backgroundColor!;

    switch (_style) {
      case RMElevatedButtonStyle.primary:
        return RMColors.primary;
      case RMElevatedButtonStyle.inverse:
        return RMColors.onBackground;
    }
  }

  Color _getForegroundColor() {
    if (isDisabled) return Colors.white;
    if (foregroundColor != null) return foregroundColor!;

    switch (_style) {
      case RMElevatedButtonStyle.primary:
        return RMColors.specificContentHigh;
      case RMElevatedButtonStyle.inverse:
        return RMColors.specificBasicWhite;
    }
  }

  Color _getDefaultIconColor() {
    switch (_style) {
      case RMElevatedButtonStyle.primary:
        return RMColors.specificBasicBlack;
      case RMElevatedButtonStyle.inverse:
        return RMColors.specificBasicWhite;
    }
  }
}

/// Estilos disponibles para RMElevatedButton
enum RMElevatedButtonStyle { primary, inverse }
