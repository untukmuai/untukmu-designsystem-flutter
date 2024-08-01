import 'package:flutter/material.dart';
import 'package:untukmu_flutter_design_system/src/common/sizing.dart';
import 'package:untukmu_flutter_design_system/src/components/breadcrumb/breadcrumb_item.dart';
import 'package:untukmu_flutter_design_system/src/components/breadcrumb/constant/breadcrumb_item_type.dart';
import 'package:untukmu_flutter_design_system/src/styles/colors.dart';

class BreadcrumbGroup extends StatelessWidget {
  const BreadcrumbGroup(
      {super.key,
      this.itemIcon,
      this.separatorIcon = Icons.brightness_1,
      this.separatorSize = 12,
      required this.items,
      this.type});

  final IconData? separatorIcon;
  final double? separatorSize;
  final IconData? itemIcon;
  final List<String> items;
  final BreadcrumbItemType? type;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: _buildRowChildren(),
        ));
  }

  List<Widget> _buildRowChildren() {
    List<Widget> children = [];

    for (int i = 0; i < items.length; i++) {
      children.add(BreadcrumbItem(
          type: type ?? BreadcrumbItemType.iconLabel,
          icon: itemIcon,
          label: items[i]));
      if (i < items.length - 1) {
        children.add(Container(
          margin: const EdgeInsets.symmetric(horizontal: DLSSizing.s3xSmall),
          child: Icon(
            separatorIcon,
            size: separatorSize,
            color: DLSColors.iconDisabled300,
          ),
        ));
      }
    }

    return children;
  }
}
