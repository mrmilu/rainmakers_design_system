import 'package:flutter/material.dart';

import '../../assets/rm_assets.dart';
import '../../theme/theme.dart';
import 'image_asset_widget.dart';

class RMRowIconTextWidget extends StatelessWidget {
  const RMRowIconTextWidget({
    super.key,
    required this.text,
    this.textStyle,
    this.iconPath,
    this.iconSize = 16,
    this.iconColor,
    this.spacing = 4.0,
  });
  final String text;
  final TextStyle? textStyle;
  final String? iconPath;
  final double iconSize;
  final Color? iconColor;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (iconPath != null) ...[
          RMImageAssetWidget(
            path: iconPath!,
            width: iconSize,
            height: iconSize,
            color: iconColor,
          ),
          SizedBox(width: spacing),
        ],
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(top: 1.0),
            child: Text(text, style: textStyle ?? RMTextStyles.labelSmallStyle),
          ),
        ),
      ],
    );
  }

  factory RMRowIconTextWidget.info(String text) {
    return RMRowIconTextWidget(
      text: text,
      iconPath: RMAssets.iconInfo,
      iconSize: 16,
      iconColor: RMColors.specificBasicBlack,
    );
  }

  factory RMRowIconTextWidget.warning(String text, {Color? textColor}) {
    return RMRowIconTextWidget(
      text: text,
      iconPath: RMAssets.iconWarning,
      iconSize: 16,
      iconColor: RMColors.specificSemanticWarning,
      textStyle: RMTextStyles.labelSmallStyle.copyWith(
        color: textColor ?? RMColors.specificSemanticWarning,
      ),
    );
  }

  factory RMRowIconTextWidget.error(String text, {Color? textColor}) {
    return RMRowIconTextWidget(
      text: text,
      iconPath: RMAssets.iconError,
      iconSize: 16,
      iconColor: RMColors.specificSemanticError,
      textStyle: RMTextStyles.labelSmallStyle.copyWith(
        color: textColor ?? RMColors.specificSemanticError,
      ),
    );
  }
}
