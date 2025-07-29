import 'package:flutter/material.dart';

import '../../../theme/theme.dart';
import '../../common/image_asset_widget.dart';
import '../text/rm_text.dart';

class RMTagIconWidget extends StatelessWidget {
  const RMTagIconWidget({
    super.key,
    required this.label,
    this.textColor,
    this.backgroundColor,
    this.borderColor,
    required this.iconPath,
    this.iconColor,
  });
  final String label;
  final Color? textColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final String iconPath;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      constraints: const BoxConstraints(minWidth: 88),
      decoration: BoxDecoration(
        color: backgroundColor ?? RMColors.background,
        borderRadius: BorderRadius.circular(80),
        border: Border.all(
          width: 1,
          color: borderColor ?? backgroundColor ?? RMColors.background,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          RMImageAssetWidget(path: iconPath, width: 24, height: 24),
          const SizedBox(width: 8),
          Flexible(
            child: RMText.bodyMedium(
              label,
              color: textColor,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  factory RMTagIconWidget.fill({
    required String label,
    required String iconPath,
    Color? textColor,
    Color? borderColor,
    Color? backgroundColor,
    Color? iconColor,
  }) {
    return RMTagIconWidget(
      label: label,
      iconPath: iconPath,
      textColor: textColor,
      backgroundColor: backgroundColor ?? RMColors.background,
      borderColor: borderColor,
      iconColor: iconColor,
    );
  }

  factory RMTagIconWidget.outlined({
    required String label,
    required String iconPath,
    Color? textColor,
    Color? borderColor,
    Color? backgroundColor,
    Color? iconColor,
  }) {
    return RMTagIconWidget(
      label: label,
      iconPath: iconPath,
      textColor: textColor,
      backgroundColor: backgroundColor ?? RMColors.background,
      borderColor: borderColor ?? RMColors.specificBasicGrey,
      iconColor: iconColor,
    );
  }
}
