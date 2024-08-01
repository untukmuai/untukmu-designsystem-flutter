import 'package:flutter/material.dart';
import 'package:untukmu_flutter_design_system/src/common/radius.dart';
import 'package:untukmu_flutter_design_system/src/common/shadow.dart';
import 'package:untukmu_flutter_design_system/src/styles/colors.dart';

enum CompactButtonSize {
  /// size 24
  large(24),

  /// size 20
  medium(20);

  const CompactButtonSize(this.value);
  final double value;
}

enum CompactButtonType { stroke, ghost, white }

class CompactButton extends StatelessWidget {
  const CompactButton({
    super.key,
    this.disabled = false,
    this.onTap,
    this.size = CompactButtonSize.medium,
    this.type = CompactButtonType.stroke,
    required this.icon,
    this.iconColor = DLSColors.iconSub500,
    this.isCircle = false,
  });

  final VoidCallback? onTap;

  final CompactButtonSize size;
  final CompactButtonType type;

  final Color iconColor;
  final IconData icon;

  final bool disabled;
  final bool isCircle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: isCircle ? DLSRadius.radiusFull : DLSRadius.radius10,
        color: backgroundColor,
        boxShadow: shadow,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: disabled ? null : onTap,
          borderRadius: isCircle ? DLSRadius.radiusFull : DLSRadius.radius8,
          child: Container(
            width: size.value,
            height: size.value,
            decoration: BoxDecoration(
              borderRadius: isCircle ? DLSRadius.radiusFull : DLSRadius.radius8,
              border: border,
            ),
            child: Center(
              child: Icon(Icons.close, size: 15, color: icColor),
            ),
          ),
        ),
      ),
    );
  }

  Color? get backgroundColor {
    switch (type) {
      case CompactButtonType.ghost:
        return null;
      default:
        if (disabled) {
          return DLSColors.bgWeak100;
        }
        return DLSColors.bgWhite0;
    }
  }

  Color? get icColor {
    if (disabled) {
      return DLSColors.iconDisabled300;
    }
    return iconColor;
  }

  Border? get border {
    switch (type) {
      case CompactButtonType.stroke:
        return Border.all(width: 1, color: DLSColors.strokeSoft200);
      default:
        return null;
    }
  }

  List<BoxShadow>? get shadow {
    switch (type) {
      case CompactButtonType.ghost:
        return null;
      default:
        return [DLSShadow.smallShadow];
    }
  }
}
