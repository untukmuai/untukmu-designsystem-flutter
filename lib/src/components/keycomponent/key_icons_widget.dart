import 'package:flutter/cupertino.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

class KeyIconsWidget extends StatelessWidget {
  final Widget icon;
  final Color? backgroundColor;
  final Color? borderColor;
  const KeyIconsWidget(
      {super.key, required this.icon, this.backgroundColor, this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(
              width: 1,
              color: borderColor ?? backgroundColor ?? DLSColors.strokeSoft200),
          borderRadius: BorderRadius.circular(96),
        ),
      ),
      child: icon,
    );
  }
}
