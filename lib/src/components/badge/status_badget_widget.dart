import 'package:flutter/material.dart';
import 'package:untukmu_flutter_design_system/src/common/radius.dart';
import 'package:untukmu_flutter_design_system/src/styles/colors.dart';
import 'package:untukmu_flutter_design_system/src/styles/text_styles.dart';

enum StatusBadgeStyle { light, filled, stroke }

class StatusBadgeWidget extends StatelessWidget {
  const StatusBadgeWidget({
    super.key,
    this.prefixWidget,
    this.title = 'Badge',
    this.suffixWidget,
    this.style = StatusBadgeStyle.light,
    this.strokeColor = DLSColors.textMain900,
    this.backgroundColor = DLSColors.textMain900,
    this.textColor = DLSColors.bgWhite0,
    this.disabled = false,
    this.isExpanded = false,
  });

  final StatusBadgeStyle style;

  final Widget? prefixWidget;
  final String title;
  final Widget? suffixWidget;

  final Color strokeColor;
  final Color backgroundColor;
  final Color textColor;

  final bool disabled;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: radius,
        color: bgColor,
        border: border,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              margin: EdgeInsets.only(right: prefixWidget == null ? 0 : 4),
              child: prefixWidget),
          expandedWidget(
            Text(
              title,
              style: DLSTextStyle.labelSmall.copyWith(color: labelColor),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: suffixWidget == null ? 0 : 4),
              child: suffixWidget),
        ],
      ),
    );
  }

  Widget expandedWidget(Widget child) {
    if (isExpanded) {
      return Expanded(child: child);
    }

    return child;
  }

  EdgeInsetsGeometry get padding => const EdgeInsets.fromLTRB(4, 4, 8, 4);

  BorderRadius get radius => DLSRadius.radius16;

  Color? get bgColor {
    if (!disabled && style != StatusBadgeStyle.stroke) {
      return backgroundColor;
    }

    return DLSColors.bgWhite0;
  }

  BoxBorder? get border {
    if (!disabled && style == StatusBadgeStyle.stroke) {
      return Border.all(color: strokeColor);
    } else if (disabled) {
      return Border.all(color: DLSColors.strokeSoft200);
    }

    return null;
  }

  Color? get labelColor {
    if (disabled) {
      return DLSColors.textDisabled300;
    }

    return textColor;
  }
}
