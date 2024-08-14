import 'package:flutter/material.dart';
import 'package:untukmu_flutter_design_system/src/common/sizing.dart';
import 'package:untukmu_flutter_design_system/src/components/breadcrumb/constant/breadcrumb_item_type.dart';
import 'package:untukmu_flutter_design_system/src/styles/colors.dart';
import 'package:untukmu_flutter_design_system/src/styles/text_styles.dart';

class BreadcrumbItemWidget extends StatelessWidget {
  const BreadcrumbItemWidget(
      {super.key,
      this.icon,
      this.label = 'Breadcrumb',
      this.type = BreadcrumbItemType.iconLabel});

  final BreadcrumbItemType type;

  final IconData? icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          iconWidget,
          SizedBox(
              width: type == BreadcrumbItemType.iconLabel && icon != null
                  ? DLSSizing.s3xSmall
                  : 0),
          textWidget,
        ],
      ),
    );
  }

  Widget get iconWidget {
    if (icon == null || type == BreadcrumbItemType.label) {
      return const SizedBox();
    }

    return Icon(
      icon,
      size: 20,
      color: DLSColors.iconSub500,
    );
  }

  Widget get textWidget {
    if (type == BreadcrumbItemType.icon) {
      return const SizedBox();
    }

    return Text(
      label,
      style: DLSTextStyle.labelSmall.copyWith(color: DLSColors.textSub500),
    );
  }
}
