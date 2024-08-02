import 'package:flutter/material.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

enum SocialButtonType { normal, icon, stroke, strokeIcon }

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    this.type = SocialButtonType.normal,
    this.label = 'Social Media',
    required this.icon,
    this.color = DLSColors.textMain900,
  });

  final SocialButtonType type;
  final String label;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    bool isIcon =
        type == SocialButtonType.icon || type == SocialButtonType.strokeIcon;

    return CustomButton(
      isIconMode: isIcon,
      style: style,
      icon: icon,
      onPressed: () {},
      prefixPadding: DLSSizing.s3xSmall,
      prefixIcon: icon,
      filledColor: color,
      label: label,
      labelColor: color,
      strokeColor: DLSColors.strokeSoft200,
    );
  }

  CustomButtonStyle get style {
    switch (type) {
      case SocialButtonType.stroke:
      case SocialButtonType.strokeIcon:
        return CustomButtonStyle.stroke;
      default:
        return CustomButtonStyle.filled;
    }
  }
}
