import 'package:flutter/material.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

class CustomPaginationWidget extends StatelessWidget {
  const CustomPaginationWidget(
      {super.key,
      this.active = false,
      this.enabled = true,
      this.type = CustomPaginationType.rounded,
      this.value = '1',
      this.icon,
      this.iconSize = 20,
      this.onTap});

  final VoidCallback? onTap;

  final CustomPaginationType type;

  final bool active;
  final bool enabled;

  final String value;
  final IconData? icon;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    bool isCircle = type == CustomPaginationType.circle;

    return Container(
      decoration: BoxDecoration(
        color: enabled && active ? DLSColors.bgWeak100 : DLSColors.bgWhite0,
        borderRadius: isCircle ? DLSRadius.radiusFull : DLSRadius.radius8,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: isCircle ? DLSRadius.radiusFull : DLSRadius.radius8,
          onTap: !enabled || active ? null : onTap,
          child: Container(
            constraints: const BoxConstraints(minHeight: 34, minWidth: 34),
            padding: const EdgeInsets.all(6),
            decoration: icon != null
                ? null
                : BoxDecoration(
                    borderRadius:
                        isCircle ? DLSRadius.radiusFull : DLSRadius.radius8,
                    border:
                        Border.all(width: 1, color: DLSColors.strokeSoft200),
                  ),
            child: icon != null
                ? Icon(
                    icon,
                    size: iconSize,
                    color: onTap == null
                        ? DLSColors.iconDisabled300
                        : DLSColors.iconStrong900,
                  )
                : Text(
                    value,
                    style: DLSTextStyle.labelMedium.copyWith(
                        color: enabled
                            ? DLSColors.textSub500
                            : DLSColors.textDisabled300),
                    textAlign: TextAlign.center,
                  ),
          ),
        ),
      ),
    );
  }
}
