import 'package:flutter/material.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

enum LabelType { normal, mandatory, optional }

class Label extends StatelessWidget {
  final String label;
  final LabelType labelType;
  final bool isDisabled;
  const Label(
      {super.key,
      required this.label,
      this.labelType = LabelType.normal,
      this.isDisabled = false});

  @override
  Widget build(BuildContext context) {
    return createLabel(label);
  }

  Widget createLabel(String label) {
    if (labelType == LabelType.mandatory) {
      return Container(
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
          decoration: BoxDecoration(
              border: Border.all(
                  color: isDisabled
                      ? DLSColors.textDisabled300
                      : DLSColors.flamingoPinkLight,
                  width: 1.0),
              borderRadius: BorderRadius.circular(100)),
          child: Text(
            label,
            style: DLSTextStyle.labelXSmall.copyWith(
                color: isDisabled
                    ? DLSColors.textDisabled300
                    : DLSColors.flamingoPinkBase),
          ));
    } else if (labelType == LabelType.optional) {
      return Row(
        children: [
          Text('($label) ',
              style: DLSTextStyle.labelSmall.copyWith(
                  color: isDisabled
                      ? DLSColors.textDisabled300
                      : DLSColors.textMain900)),
          const Icon(
            Icons.info,
            color: DLSColors.iconDisabled300,
          )
        ],
      );
    } else {
      return Text(
        label,
        style: DLSTextStyle.labelSmall.copyWith(
            color:
                isDisabled ? DLSColors.textDisabled300 : DLSColors.textMain900),
      );
    }
  }
}
