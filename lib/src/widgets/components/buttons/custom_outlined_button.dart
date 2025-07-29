import 'package:flutter/material.dart';

import '../../../theme/theme.dart';
import '../../common/button_scale_widget.dart';
import '../../common/image_asset_widget.dart';

/// Widget de botón outlined personalizado del design system
///
/// Uso:
/// ```dart
/// RMOutlinedButton.primary(
///   key: Key('my-outlined-button'),
///   label: 'Outlined Button',
///   onPressed: () {},
/// )
/// ```
class RMOutlinedButton extends StatelessWidget {
  /// Texto del botón
  final String label;

  /// Función que se ejecuta al presionar el botón
  final VoidCallback onPressed;

  /// Color de fondo personalizado
  final Color? backgroundColor;

  /// Color del texto personalizado
  final Color? foregroundColor;

  /// Padding personalizado
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

  /// Widget de icono personalizado
  final Widget? iconWidget;

  const RMOutlinedButton._({
    super.key,
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
    this.iconWidget,
  });

  /// Crea un botón outlined con estilo primario
  const RMOutlinedButton.primary({
    Key? key,
    required String label,
    required VoidCallback onPressed,
    Color? backgroundColor,
    Color? foregroundColor,
    EdgeInsets? padding,
    bool isDisabled = false,
    bool isLoading = false,
    String? iconPath,
    bool iconRight = false,
    TextAlign? textAlign,
    Widget? iconWidget,
  }) : this._(
         key: key,
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
         iconWidget: iconWidget,
       );

  @override
  Widget build(BuildContext context) {
    return RMButtonScaleWidget(
      onTap: isDisabled
          ? null
          : () {
              if (isLoading) return;
              onPressed();
            },
      child: OutlinedButton(
        onPressed: () {
          if (isLoading || isDisabled) return;
          onPressed();
        },
        style: OutlinedButton.styleFrom(
          disabledBackgroundColor: Colors.transparent,
          disabledForegroundColor: RMColors.disabled,
          side: BorderSide(
            color: isDisabled
                ? RMColors.disabled
                : foregroundColor ?? RMColors.specificContentHigh,
          ),
          backgroundColor: isDisabled ? Colors.transparent : backgroundColor,
          foregroundColor: isDisabled
              ? RMColors.disabled
              : foregroundColor ?? RMColors.specificContentHigh,
          padding: padding,
        ),
        child: isLoading
            ? SizedBox(
                height: 16,
                width: 16,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: foregroundColor ?? RMColors.specificBasicWhite,
                ),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (!iconRight && iconPath != null) ...[
                    RMImageAssetWidget(path: iconPath!, width: 20, height: 20),
                    const SizedBox(width: 8),
                  ],
                  if (!iconRight && iconWidget != null) ...[
                    iconWidget!,
                    const SizedBox(width: 8),
                  ],
                  Flexible(child: Text(label, textAlign: textAlign)),
                  if (iconRight && iconPath != null) ...[
                    const SizedBox(width: 8),
                    RMImageAssetWidget(path: iconPath!, width: 20, height: 20),
                  ],
                  if (iconRight && iconWidget != null) ...[
                    const SizedBox(width: 8),
                    iconWidget!,
                  ],
                ],
              ),
      ),
    );
  }
}
