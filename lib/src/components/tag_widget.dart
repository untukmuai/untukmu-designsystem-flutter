import 'package:flutter/material.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

class CustomTagWidget extends StatelessWidget {
  const CustomTagWidget({
    super.key,
    this.label = 'Tag',
    this.disabled = false,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    this.badge,
    this.filledColor,
    this.textColor,
  });

  final VoidCallback? onTap;

  final Color? filledColor;
  final Color? textColor;

  final IconData? prefixIcon;
  final IconData? suffixIcon;

  final String label;

  final bool disabled;

  final CustomBadgeWidget? badge;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: DLSRadius.radiusFull,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: DLSRadius.radiusFull,
          onTap: onTap == null || disabled
              ? null
              : () {
                  onTap!();
                },
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: DLSSizing.s2xSmall,
              vertical: DLSSizing.s4xSmall,
            ),
            decoration: BoxDecoration(
              borderRadius: DLSRadius.radiusFull,
              border: borderColor != null
                  ? Border.all(width: 1, color: borderColor!)
                  : null,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (badge != null) badge!,
                if (badge != null) const SizedBox(width: DLSSizing.s4xSmall),
                if (prefixIcon != null)
                  Icon(
                    prefixIcon,
                    color: labelColor,
                    size: 16,
                  ),
                if (prefixIcon != null)
                  const SizedBox(width: DLSSizing.s4xSmall),
                Text(
                  label,
                  style: DLSTextStyle.labelSmall.copyWith(color: labelColor),
                ),
                if (suffixIcon != null)
                  const SizedBox(width: DLSSizing.s4xSmall),
                if (suffixIcon != null)
                  Icon(
                    suffixIcon,
                    color: labelColor,
                    size: 14,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color? get backgroundColor {
    if (disabled) {
      return DLSColors.bgWeak100;
    }

    if (filledColor != null) {
      return filledColor;
    }

    return DLSColors.bgWhite0;
  }

  Color? get borderColor {
    if (disabled || filledColor != null) {
      return null;
    }

    return DLSColors.strokeSoft200;
  }

  Color? get labelColor {
    if (disabled) {
      return DLSColors.textDisabled300;
    }

    if (textColor != null) {
      return textColor;
    }

    return DLSColors.textSub500;
  }
}
