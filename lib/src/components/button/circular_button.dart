import 'package:flutter/material.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

class CircularButtonWidget extends StatelessWidget {
  final Function pickFile;
  final String label;
  final Color? color;
  const CircularButtonWidget(
      {super.key, required this.pickFile, required this.label, this.color});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(9999),
        onTap: () {
          pickFile();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 9.5, vertical: 9),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side:
                  BorderSide(width: 1, color: color ?? DLSColors.strokeSoft200),
              borderRadius: BorderRadius.circular(9999),
            ),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: DLSTextStyle.labelXSmall
                .copyWith(color: color ?? DLSColors.textSub500),
          ),
        ),
      ),
    );
  }
}
