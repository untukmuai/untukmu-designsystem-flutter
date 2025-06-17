import 'package:flutter/material.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

enum FancyButtonStyle { filled, stroke, lighter }

class FancyButtonWidget extends StatelessWidget {
  const FancyButtonWidget({
    super.key,
    this.onPressed,
    this.label = 'Button',
    this.type = CustomButtonType.primary,
    this.style = FancyButtonStyle.filled,
    this.size = CustomButtonSize.medium,
    this.prefixIcon,
    this.suffixIcon,
    this.disabled = false,
  });

  final String label;
  final VoidCallback? onPressed;

  final CustomButtonType type;
  final FancyButtonStyle style;
  final CustomButtonSize? size;

  final IconData? prefixIcon;
  final IconData? suffixIcon;

  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: DLSRadius.radius10,
        color: backgroundColor,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: disabled ? null : onPressed,
          borderRadius: DLSRadius.radius10,
          child: Container(
            margin: const EdgeInsets.all(1),
            padding: padding,
            decoration: BoxDecoration(
              borderRadius: DLSRadius.radius10,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white.withValues(alpha: 0.0),
                  Colors.white.withValues(alpha: 0.12),
                ],
              ),
            ),
            child: Row(
              children: [
                prefixIcon == null
                    ? const SizedBox()
                    : Padding(
                        padding: prefixIconPadding,
                        child: Icon(
                          prefixIcon,
                          size: 14,
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
                          size: 14,
                          color: textColor,
                        ),
                      ),
              ],
            ),
          ),
        ),
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
        return const EdgeInsets.all(6);
      case CustomButtonSize.small:
        return const EdgeInsets.all(DLSSizing.s3xSmall);
      default:
        return const EdgeInsets.symmetric(
            horizontal: DLSSizing.s3xSmall, vertical: 10);
    }
  }

  EdgeInsetsGeometry get prefixIconPadding {
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
    if (disabled) {
      return DLSColors.bgWeak100;
    }

    switch (style) {
      case FancyButtonStyle.filled:
        switch (type) {
          case CustomButtonType.primary:
            return DLSColors.primaryBase;
          case CustomButtonType.neutral:
            return DLSColors.bgSurface700;
          case CustomButtonType.error:
            return DLSColors.redBase;
        }
      case FancyButtonStyle.lighter:
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

    switch (style) {
      case FancyButtonStyle.lighter:
      case FancyButtonStyle.stroke:
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

    switch (style) {
      case FancyButtonStyle.stroke:
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
