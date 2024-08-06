import 'package:flutter/material.dart';
import 'package:untukmu_flutter_design_system/src/styles/colors.dart';
import 'package:untukmu_flutter_design_system/src/styles/text_styles.dart';

class LegendWidget extends StatelessWidget {
  final Color color;
  final String? label;

  const LegendWidget({super.key, required this.color, this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: ShapeDecoration(
            shape: const OvalBorder(
              side: BorderSide(width: 2, color: DLSColors.strokeWhite0),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x0A1B1C1D),
                blurRadius: 4,
                offset: Offset(0, 2),
                spreadRadius: 0,
              )
            ],
            color: color,
          ),
        ),
        if (label != null)
          Container(
            margin: const EdgeInsets.only(left: 4),
            child: Text(
              label!,
              style: DLSTextStyle.paragraphSmall
                  .copyWith(color: DLSColors.textSub500),
            ),
          ),
      ],
    );
  }
}
