import 'package:flutter/material.dart';
import 'package:untukmu_flutter_design_system/src/common/radius.dart';
import 'package:untukmu_flutter_design_system/src/components/avatar/circular_avatar.dart';
import 'package:untukmu_flutter_design_system/src/components/avatar/constant/avatar_size.dart';
import 'package:untukmu_flutter_design_system/src/components/avatar/constant/compact_avatar_group_style.dart';
import 'package:untukmu_flutter_design_system/src/components/avatar/models/avatar_group_item.dart';
import 'package:untukmu_flutter_design_system/src/styles/colors.dart';
import 'package:untukmu_flutter_design_system/src/styles/text_styles.dart';

class CompactAvatarGroup extends StatelessWidget {
  const CompactAvatarGroup(
      {super.key,
      this.items,
      this.size = AvatarSize.size32,
      this.maxItem = 3,
      this.style = CompactAvatarGroupStyle.solid});

  final int maxItem;
  final AvatarSize size;
  final List<AvatarGroupItemModel>? items;
  final CompactAvatarGroupStyle style;

  @override
  Widget build(BuildContext context) {
    if (maxItem < 3) {
      throw Exception('Max item should be >2 item');
    }

    List<AvatarGroupItemModel> items = this.items ?? [];
    if (items.isEmpty) {
      return const SizedBox();
    }
    bool isGrouped = items.length > maxItem;
    List<AvatarGroupItemModel> filterItems =
        List.from(items.getRange(0, maxItem), growable: true);
    if (isGrouped) {
      filterItems.add(AvatarGroupItemModel(
          name: '+${items.length - filterItems.length}', isExtent: true));
    }

    double fontSize = size.value * 0.35;
    double margin = size.value * 0.25;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 0.25, horizontal: 4),
      decoration: BoxDecoration(
        color: DLSColors.bgWhite0,
        borderRadius: DLSRadius.radiusFull,
      ),
      child: Row(
        children: filterItems.map(
          (item) {
            if (item.isExtent) {
              return Container(
                margin: EdgeInsets.only(left: margin, right: margin / 2),
                child: Text(
                  item.name!,
                  style: extentTextStyle.copyWith(fontSize: fontSize),
                ),
              );
            }

            return Align(
              widthFactor: 0.8,
              child: CustomCircularAvatar(
                name: item.name,
                url: item.url,
                avatarSize: size,
                isExtendValue: item.isExtent,
                showBorder: true,
              ),
            );
          },
        ).toList(),
      ),
    );
  }

  TextStyle get extentTextStyle {
    switch (size) {
      case AvatarSize.size32:
      case AvatarSize.size40:
      case AvatarSize.size48:
      case AvatarSize.size56:
      case AvatarSize.size64:
      case AvatarSize.size72:
      case AvatarSize.size80:
        return DLSTextStyle.paragraphMedium;
      default:
        return DLSTextStyle.paragraphSmall;
    }
  }
}
