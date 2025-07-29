import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class RMSimpleBlockWidget extends StatelessWidget {
  const RMSimpleBlockWidget({
    super.key,
    required this.child,
    this.padding,
    this.borderRadius,
    this.border,
    this.backgroundColor,
  });
  final Widget child;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final Border? border;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: borderRadius ?? BorderRadius.circular(24),
        border: border,
      ),
      child: Padding(
        padding: padding ?? const EdgeInsets.all(16),
        child: child,
      ),
    );
  }

  factory RMSimpleBlockWidget.withBorder({
    required Widget child,
    EdgeInsets? padding,
    BorderRadius? borderRadius,
    Color? bordeColor,
    Color? backgroundColor,
  }) {
    return RMSimpleBlockWidget(
      padding: padding,
      borderRadius: borderRadius,
      backgroundColor: backgroundColor,
      border: Border.all(color: bordeColor ?? RMColors.disabled),
      child: child,
    );
  }
}
