import 'package:flutter/material.dart';
import 'package:untukmu_flutter_design_system/src/common/radius.dart';
import 'package:untukmu_flutter_design_system/src/styles/colors.dart';
import 'package:untukmu_flutter_design_system/src/styles/text_styles.dart';

enum CustomBadgeSize { small, medium }

enum CustomBadgeStyle { light, filled, stroke }

class CustomBadgeWidget extends StatelessWidget {
  const CustomBadgeWidget({
    super.key,
    this.size = CustomBadgeSize.small,
    this.prefixIcon,
    this.title = 'Badge',
    this.suffixIcon,
    this.style = CustomBadgeStyle.light,
    this.strokeColor = DLSColors.textMain900,
    this.backgroundColor = DLSColors.textMain900,
    this.textColor = DLSColors.bgWhite0,
    this.disabled = false,
  });

  final CustomBadgeSize size;
  final CustomBadgeStyle style;

  final Icon? prefixIcon;
  final String title;
  final Icon? suffixIcon;

  final Color strokeColor;
  final Color backgroundColor;
  final Color textColor;

  final bool disabled;

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
              margin: EdgeInsets.only(right: prefixIcon == null ? 0 : 4),
              child: icon(prefixIcon)),
          Text(
            title,
            style: DLSTextStyle.labelXSmall.copyWith(color: labelColor),
          ),
          Container(
              margin: EdgeInsets.only(left: suffixIcon == null ? 0 : 4),
              child: icon(suffixIcon)),
        ],
      ),
    );
  }

  EdgeInsetsGeometry get padding => EdgeInsets.symmetric(
      horizontal: 8, vertical: size == CustomBadgeSize.small ? 1 : 3);

  BorderRadius get radius =>
      size == CustomBadgeSize.small ? DLSRadius.radius4 : DLSRadius.radius8;

  Color? get bgColor {
    if (!disabled && style != CustomBadgeStyle.stroke) {
      return backgroundColor;
    }

    return null;
  }

  BoxBorder? get border {
    if (!disabled && style == CustomBadgeStyle.stroke) {
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

  Widget icon(Icon? icon) {
    if (icon == null) {
      return const SizedBox();
    }
    if (!disabled) {
      return icon;
    }

    return Icon(
      icon.icon,
      color: DLSColors.iconDisabled300,
      size: icon.size,
    );
  }
}
