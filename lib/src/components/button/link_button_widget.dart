import 'package:flutter/material.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

enum LinkButtonStyle { gray, black, primary, error }

enum LinkButtonSize { medium, small }

class LinkButtonWidget extends StatelessWidget {
  const LinkButtonWidget(
      {super.key,
      this.size = LinkButtonSize.medium,
      this.style = LinkButtonStyle.primary,
      this.label = 'Link Button',
      this.disabled = false,
      this.icon = Icons.arrow_forward_ios_rounded});

  final IconData icon;
  final LinkButtonSize size;
  final LinkButtonStyle style;
  final String label;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: disabled ? null : () {},
      child: Row(
        children: [
          Text(
            label,
            style: DLSTextStyle.labelSmall.copyWith(color: color),
          ),
          const SizedBox(width: DLSSizing.s4xSmall),
          Icon(icon, size: iconSize, color: color),
        ],
      ),
    );
  }

  Color get color {
    if (disabled) {
      return DLSColors.textDisabled300;
    }

    switch (style) {
      case LinkButtonStyle.gray:
        return DLSColors.textSub500;
      case LinkButtonStyle.black:
        return DLSColors.textMain900;
      case LinkButtonStyle.error:
        return DLSColors.errorBase;
      default:
        return DLSColors.primaryBase;
    }
  }

  double get iconSize {
    switch (size) {
      case LinkButtonSize.medium:
        return 20;
      default:
        return 16;
    }
  }
}
