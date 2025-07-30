import 'package:flutter/material.dart';

import '../../../theme/theme.dart';
import '../../common/image_asset_widget.dart';

/// Widget de botón de icono personalizado del design system
///
/// Uso:
/// ```dart
/// RMIconButton.primary(
///   key: Key('my-icon-button'),
///   iconPath: RMAssets.iconInfo, // Usar assets del package
///   onPressed: () {},
/// )
///
/// // O con un icono personalizado:
/// RMIconButton.primary(
///   iconPath: RMAssets.iconPath('mi_icono.svg'),
///   onPressed: () {},
/// )
/// ```

/// Widget de botón de icono personalizado del design system
///
/// Uso:
/// ```dart
/// RMIconButton.primary(
///   key: Key('my-icon-button'),
///   iconPath: 'assets/icons/star.png',
///   onPressed: () {},
/// )
/// ```
class RMIconButton extends StatelessWidget {
  /// Ruta del icono
  final String iconPath;

  /// Función que se ejecuta al presionar el botón
  final VoidCallback? onPressed;

  /// Si el botón está habilitado
  final bool enabled;

  /// Si el botón está en estado de carga
  final bool isLoading;

  /// Color de fondo personalizado
  final Color? backgroundColor;

  /// Color del icono personalizado
  final Color? foregroundColor;

  const RMIconButton._({
    super.key,
    required this.iconPath,
    required this.onPressed,
    this.enabled = true,
    this.isLoading = false,
    this.backgroundColor,
    this.foregroundColor,
  });

  /// Crea un botón de icono con estilo primario
  const RMIconButton.primary({
    Key? key,
    required String iconPath,
    required VoidCallback? onPressed,
    bool enabled = true,
    bool isLoading = false,
    Color? backgroundColor,
    Color? foregroundColor,
  }) : this._(
         key: key,
         iconPath: iconPath,
         onPressed: onPressed,
         enabled: enabled,
         isLoading: isLoading,
         backgroundColor: backgroundColor,
         foregroundColor: foregroundColor,
       );

  @override
  Widget build(BuildContext context) {
    final effectiveOnPressed = enabled ? onPressed : null;

    return TextButton(
      onPressed: effectiveOnPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        minimumSize: const Size(12, 12),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.compact,
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        foregroundColor: Colors.black,
        overlayColor: Colors.transparent,
        backgroundColor: _getBackgroundColor(),
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
          : RMImageAssetWidget(
              path: iconPath,
              height: 20,
              width: 20,
              color: _getIconColor(),
            ),
    );
  }

  Color? _getBackgroundColor() {
    if (!enabled) return RMColors.disabled;
    return backgroundColor ?? RMColors.primary;
  }

  Color _getForegroundColor() {
    return foregroundColor ?? RMColors.specificBasicWhite;
  }

  Color? _getIconColor() {
    if (!enabled) return Colors.white;
    return foregroundColor ?? RMColors.specificBasicBlack;
  }
}

/// Estilos disponibles para RMIconButton
enum RMIconButtonStyle { primary }
