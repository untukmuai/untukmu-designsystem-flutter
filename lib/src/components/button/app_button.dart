import 'package:flutter/material.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    this.label = 'Button',
    this.type = CustomButtonType.primary,
    this.style = CustomButtonStyle.filled,
    this.size = CustomButtonSize.medium,
    this.isIconMode = false,
    this.icon,
    this.prefixIcon,
    this.suffixIcon,
    this.disabled = false,
    this.filledColor,
    this.labelColor,
    this.strokeColor,
    this.prefixPadding,
  });

  final String label;
  final VoidCallback? onPressed;

  final CustomButtonType type;
  final CustomButtonStyle style;
  final CustomButtonSize? size;

  final IconData? icon;
  final bool isIconMode;

  final double? prefixPadding;
  final IconData? prefixIcon;
  final IconData? suffixIcon;

  final bool disabled;

  final Color? filledColor;
  final Color? labelColor;
  final Color? strokeColor;

  @override
  Widget build(BuildContext context) {
    if (isIconMode) {
      if (icon == null) {
        throw Exception('Icon cannot be null');
      } else {
        return IconButton(
          onPressed: disabled ? null : onPressed,
          icon: Icon(
            icon,
            size: 16,
            color: textColor,
          ),
          style: TextButton.styleFrom(
            padding: iconPadding,
            backgroundColor: backgroundColor,
            side: border,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            minimumSize: const Size(28, 28),
          ),
        );
      }
    }

    return TextButton(
      onPressed: disabled ? null : onPressed,
      style: TextButton.styleFrom(
        padding: padding,
        backgroundColor: backgroundColor,
        side: border,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: const Size(50, 30),
      ),
      child: Row(
        children: [
          prefixIcon == null
              ? const SizedBox()
              : Padding(
                  padding: prefixIconPadding,
                  child: Icon(
                    prefixIcon,
                    size: 16,
                    color: textColor,
                  ),
                ),
          Text(
            label,
            style: textStyle.copyWith(color: textColor),
          ),
          suffixIcon == null
              ? const SizedBox()
              : Padding(
                  padding: suffixIconPadding,
                  child: Icon(
                    suffixIcon,
                    size: 16,
                    color: textColor,
                  ),
                ),
        ],
      ),
    );
  }

  EdgeInsetsGeometry get iconPadding {
    switch (size) {
      case CustomButtonSize.xSmall:
        return const EdgeInsets.all(6);
      case CustomButtonSize.small:
        return const EdgeInsets.all(10);
      default:
        return const EdgeInsets.all(12);
    }
  }

  EdgeInsetsGeometry get padding {
    switch (size) {
      case CustomButtonSize.xSmall:
        return const EdgeInsets.symmetric(
            horizontal: DLSSizing.s3xSmall, vertical: DLSSizing.s4xSmall);
      case CustomButtonSize.small:
        return const EdgeInsets.all(DLSSizing.s3xSmall);
      default:
        return const EdgeInsets.all(DLSSizing.s2xSmall);
    }
  }

  EdgeInsetsGeometry get prefixIconPadding {
    if (prefixPadding != null) {
      return EdgeInsets.only(right: prefixPadding!);
    }

    switch (size) {
      case CustomButtonSize.xSmall:
        return const EdgeInsets.only(right: DLSSizing.s5xSmall);
      default:
        return const EdgeInsets.only(right: DLSSizing.s4xSmall);
    }
  }

  EdgeInsetsGeometry get suffixIconPadding {
    switch (size) {
      case CustomButtonSize.xSmall:
        return const EdgeInsets.only(left: DLSSizing.s5xSmall);
      default:
        return const EdgeInsets.only(left: DLSSizing.s4xSmall);
    }
  }

  Color? get backgroundColor {
    if (style == CustomButtonStyle.ghost) {
      return null;
    }

    if (disabled) {
      return DLSColors.bgWeak100;
    }

    if (filledColor != null &&
        style != CustomButtonStyle.stroke &&
        style != CustomButtonStyle.ghost) {
      return filledColor;
    }

    switch (style) {
      case CustomButtonStyle.filled:
        switch (type) {
          case CustomButtonType.primary:
            return DLSColors.primaryBase;
          case CustomButtonType.neutral:
            return DLSColors.bgSurface700;
          case CustomButtonType.error:
            return DLSColors.redBase;
        }
      case CustomButtonStyle.lighter:
        switch (type) {
          case CustomButtonType.primary:
            return DLSColors.orchidPurpleLighter;
          case CustomButtonType.neutral:
            return DLSColors.bgWeak100;
          case CustomButtonType.error:
            return DLSColors.redLighter;
        }
      default:
        return DLSColors.bgWhite0;
    }
  }

  Color get textColor {
    if (disabled) {
      return DLSColors.textDisabled300;
    }

    if (labelColor != null && style != CustomButtonStyle.filled) {
      return labelColor!;
    }

    switch (style) {
      case CustomButtonStyle.lighter:
      case CustomButtonStyle.stroke:
      case CustomButtonStyle.ghost:
        switch (type) {
          case CustomButtonType.primary:
            return DLSColors.primaryBase;
          case CustomButtonType.neutral:
            return DLSColors.textSub500;
          case CustomButtonType.error:
            return DLSColors.redBase;
        }
      default:
        return DLSColors.bgWhite0;
    }
  }

  BorderSide? get border {
    if (disabled) {
      return null;
    }

    if (strokeColor != null && style == CustomButtonStyle.stroke) {
      return BorderSide(color: strokeColor!, width: 1);
    }

    switch (style) {
      case CustomButtonStyle.stroke:
        return BorderSide(color: textColor, width: 1);
      default:
        return null;
    }
  }

  TextStyle get textStyle {
    switch (size) {
      case CustomButtonSize.xSmall:
        return DLSTextStyle.labelXSmall;
      default:
        return DLSTextStyle.labelSmall;
    }
  }
}
