import 'package:flutter/material.dart';

import '../../../theme/theme.dart';
import '../../common/row_icon_text_widget.dart';
import 'template_verification_code.dart';

class RMCodeFieldWidget extends StatelessWidget {
  const RMCodeFieldWidget({
    super.key,
    this.enabled = true,
    this.title,
    required this.onCompleted,
    this.infoText,
    this.showError = false,
    this.errorText,
  });
  final bool enabled;
  final String? title;
  final Function(String) onCompleted;
  final String? infoText;
  final bool showError;
  final String? errorText;

  Color _getBorderColor() {
    if (!enabled) {
      return RMColors.specificBasicGrey;
    }
    if (showError) {
      return RMColors.specificSemanticError;
    }
    return RMColors.specificBasicBlack;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: RMColors.specificBasicWhite,
            borderRadius: BorderRadius.circular(32),
            border: Border.all(width: 1, color: _getBorderColor()),
          ),
          alignment: Alignment.center,
          child: Center(
            child: RMVerificationCode(
              enabled: true,
              length: 6,
              textStyle: RMTextStyles.bodyMediumStyle,
              keyboardType: TextInputType.number,
              underlineColor: Colors.white,
              cursorColor: Colors.black,
              margin: EdgeInsets.zero,
              itemSize: 48,
              padding: EdgeInsets.zero,
              fullBorder: true,
              underlineWidth: 0,
              underlineUnfocusedColor: Colors.transparent,
              onCompleted: onCompleted,
              onEditing: (bool value) {},
            ),
          ),
        ),
        if ((errorText != null && showError) || infoText != null) ...[
          const SizedBox(height: 8),
          showError
              ? RMRowIconTextWidget.warning(errorText!)
              : RMRowIconTextWidget.info(infoText!),
        ],
      ],
    );
  }
}
