import 'package:flutter/material.dart';
import 'package:rainmakers_design_system/rainmakers_design_system.dart';

class RMDropdownFieldWidget<T> extends StatelessWidget {
  const RMDropdownFieldWidget({
    super.key,
    this.enabled = true,
    this.title,
    this.initialValue,
    required this.onChanged,
    this.infoText,
    this.showError = false,
    this.errorText,
    this.readOnly = false,
    required this.items,
    this.borderRadius = 32.0,
  });
  final bool enabled;
  final String? title;
  final String? initialValue;
  final Function(T) onChanged;
  final String? infoText;
  final bool showError;
  final String? errorText;
  final bool readOnly;
  final double borderRadius;

  final List<DropdownMenuItem<T>>? items;

  Color _getBorderColor() {
    if (!enabled || readOnly) {
      return RMColors.specificBasicGrey;
    }
    if (showError) {
      return RMColors.specificSemanticError;
    }
    return RMColors.specificBasicBlack;
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: readOnly,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: readOnly
                  ? RMColors.specificBasicGrey
                  : RMColors.specificBasicWhite,
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(width: 1, color: _getBorderColor()),
            ),
            alignment: Alignment.center,
            child: Center(
              child: DropdownButtonFormField<T>(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 6,
                  ),
                  border: InputBorder.none,
                  enabled: enabled && !readOnly,
                  fillColor: Colors.transparent,
                  label: title != null
                      ? RMText.bodyMedium(
                          title!,
                          color: RMColors.specificBasicBlack,
                        )
                      : null,
                  labelStyle: RMTextStyles.bodyMediumStyle,
                ),
                hint: initialValue != null
                    ? RMText.bodyMedium(
                        initialValue!,
                        color: enabled && !readOnly
                            ? RMColors.specificBasicBlack
                            : RMColors.specificBasicGrey,
                      )
                    : null,
                icon: Padding(
                  padding: EdgeInsets.only(bottom: title != null ? 10.0 : 0),
                  child: RMImageAssetWidget(
                    path: RMAssets.iconArrowDown,
                    color: enabled && !readOnly
                        ? RMColors.specificBasicBlack
                        : RMColors.specificBasicGrey,
                  ),
                ),
                items: items,
                selectedItemBuilder: (context) => items!
                    .map(
                      (item) => Container(
                        alignment: Alignment.center,
                        child: RMText.bodyMedium(
                          item.value.toString(),
                          color: readOnly
                              ? RMColors.specificBasicGrey
                              : RMColors.specificBasicBlack,
                        ),
                      ),
                    )
                    .toList(),
                onChanged: enabled
                    ? (e) {
                        if (e != null) {
                          onChanged(e);
                        }
                      }
                    : null,
              ),
            ),
          ),
          if ((errorText != null && showError) || infoText != null) ...[
            const SizedBox(height: 8),
            showError
                ? RMRowIconTextWidget.error(errorText!)
                : RMRowIconTextWidget.info(infoText!),
          ],
        ],
      ),
    );
  }
}
