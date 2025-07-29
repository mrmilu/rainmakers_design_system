import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../theme/theme.dart';
import '../../common/row_icon_text_widget.dart';
import '../text/rm_text.dart';
import 'imput_formatters/cups_input_formatter.dart';

class RMCupsFieldWidget extends StatefulWidget {
  final Function(String) onCompleted;
  final Function(String)? onChanged;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final String? hintText;
  final String? labelText;
  final EdgeInsets? padding;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final String? prefixText;
  final TextEditingController? controller;
  final String? initialValue;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? borderColor;
  final int? maxLines;
  final int? maxLength;
  final bool autofocus;
  final double borderRadius;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final TextCapitalization? textCapitalization;
  final bool enabled;
  final EdgeInsetsGeometry? contentPadding;
  final String? errorText;
  final bool showError;
  final String? infoText;
  final bool isLoading;
  final bool isAccepted;
  final bool isError;

  const RMCupsFieldWidget({
    super.key,
    required this.onCompleted,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.hintText,
    required this.labelText,
    this.obscureText,
    this.padding,
    this.suffixIcon,
    this.prefixIcon,
    this.controller,
    this.keyboardType,
    this.prefixText,
    this.initialValue = '',
    this.borderColor,
    this.maxLines,
    this.maxLength,
    this.autofocus = false,
    this.borderRadius = 32,
    this.focusNode,
    this.decoration,
    this.textAlign,
    this.textStyle,
    this.backgroundColor,
    this.textCapitalization,
    this.enabled = true,
    this.contentPadding,
    this.errorText,
    this.showError = false,
    this.infoText,
    this.isLoading = false,
    this.isAccepted = false,
    this.isError = false,
  });

  @override
  State<RMCupsFieldWidget> createState() => _RMCupsFieldWidgetState();
}

class _RMCupsFieldWidgetState extends State<RMCupsFieldWidget> {
  late final TextEditingController _controller;
  late FocusNode _focusNode;
  late ValueNotifier<double> _borderWidthNotifier;

  @override
  void initState() {
    super.initState();
    _controller =
        widget.controller ??
        TextEditingController(text: _formatCUPS(widget.initialValue ?? ''));

    _focusNode = widget.focusNode ?? FocusNode();
    _borderWidthNotifier = ValueNotifier(1.0);

    _focusNode.addListener(() {
      _borderWidthNotifier.value = _focusNode.hasFocus ? 1.8 : 1.0;
    });
  }

  @override
  void dispose() {
    _controller.dispose();

    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    _borderWidthNotifier.dispose();
    super.dispose();
  }

  String _formatCUPS(String text) {
    final cleanText = text.replaceAll(' ', '').toUpperCase();
    final formattedText = StringBuffer();
    for (int i = 0; i < cleanText.length; i++) {
      if (i == 2 || i == 6 || i == 18 || i == 20) {
        formattedText.write(' ');
      }
      formattedText.write(cleanText[i]);
    }
    return formattedText.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ValueListenableBuilder<double>(
            valueListenable: _borderWidthNotifier,
            builder: (context, borderWidth, child) {
              return Padding(
                padding: EdgeInsets.all(borderWidth == 1.8 ? 0 : 0.9),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color:
                        widget.backgroundColor ?? RMColors.specificBasicWhite,
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    border: Border.all(
                      width: borderWidth,
                      color: widget.showError
                          ? RMColors.specificSemanticError
                          : widget.borderColor ?? RMColors.specificBasicBlack,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              enabled: widget.enabled,
                              inputFormatters: [CUPSInputFormatter()],
                              maxLengthEnforcement: MaxLengthEnforcement
                                  .truncateAfterCompositionEnds,
                              textCapitalization:
                                  widget.textCapitalization ??
                                  TextCapitalization.none,
                              autofocus: widget.autofocus,
                              focusNode: _focusNode,
                              onSaved: widget.onSaved,
                              obscureText: widget.obscureText ?? false,
                              onChanged: (text) {
                                widget.onChanged?.call(text);
                              },
                              onTapOutside: (event) {
                                _focusNode.unfocus();
                                widget.onCompleted('');
                              },
                              controller: _controller,
                              validator: widget.validator,
                              style:
                                  widget.textStyle ??
                                  RMTextStyles.bodyMediumStyle.copyWith(
                                    color: widget.isError
                                        ? RMColors.specificSemanticError
                                        : RMColors.specificBasicBlack,
                                  ),
                              keyboardType: widget.keyboardType,
                              textAlign: widget.textAlign ?? TextAlign.start,
                              maxLines: widget.maxLines ?? 1,
                              maxLength: widget.maxLength,
                              cursorColor: RMColors.specificBasicBlack,
                              decoration:
                                  widget.decoration ??
                                  InputDecoration(
                                    isDense: true,
                                    filled: false,
                                    prefix: widget.prefixText != null
                                        ? RMText.bodyMedium(
                                            widget.prefixText!,
                                            color: widget.enabled
                                                ? RMColors.specificBasicBlack
                                                : RMColors.specificBasicGrey,
                                          )
                                        : null,
                                    border: InputBorder.none,
                                    fillColor: widget.backgroundColor,
                                    prefixIcon: widget.prefixIcon,
                                    suffixIcon: widget.suffixIcon,
                                    label: widget.labelText != null
                                        ? RMText.bodyMedium(
                                            widget.labelText!,
                                            color: widget.enabled
                                                ? RMColors.specificBasicBlack
                                                : RMColors.specificBasicGrey,
                                          )
                                        : null,
                                    contentPadding:
                                        widget.contentPadding ??
                                        const EdgeInsets.only(top: 0),
                                    counterStyle: TextStyle(
                                      color: RMColors.specificBasicGrey,
                                    ),
                                    suffixIconConstraints: const BoxConstraints(
                                      maxWidth: 60,
                                      maxHeight: 25,
                                    ),
                                    prefixText: widget.prefixText,
                                    hintText: widget.hintText,
                                  ),
                            ),
                          ),
                          if (widget.isLoading)
                            const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                          if (widget.isAccepted)
                            Icon(
                              Icons.check,
                              color: RMColors.specificSemanticSuccess,
                            ),
                          if (widget.isError)
                            Icon(
                              Icons.error,
                              color: RMColors.specificSemanticError,
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          if (widget.showError || widget.infoText != null) ...[
            const SizedBox(height: 6),
            widget.showError
                ? RMRowIconTextWidget.error(widget.errorText ?? '')
                : RMRowIconTextWidget.info(widget.infoText ?? ''),
          ],
        ],
      ),
    );
  }
}
