import 'package:flutter/material.dart';
import 'package:untukmu_flutter_design_system/src/components/avatar/circular_avatar.dart';
import 'package:untukmu_flutter_design_system/src/components/avatar/constant/avatar_size.dart';
import 'package:untukmu_flutter_design_system/src/components/avatar/models/avatar_group_item.dart';

class AvatarGroup extends StatefulWidget {
  const AvatarGroup(
      {super.key, this.items, this.maxItem = 4, this.size = AvatarSize.size32});

  final List<AvatarGroupItemModel>? items;
  final int maxItem;
  final AvatarSize size;

  @override
  State<AvatarGroup> createState() => _AvatarGroupState();
}

class _AvatarGroupState extends State<AvatarGroup> {
  @override
  Widget build(BuildContext context) {
    if (widget.maxItem < 3) {
      throw Exception('Max item should be >2 item');
    }

    List<AvatarGroupItemModel> items = widget.items ?? [];
    if (items.isEmpty) {
      return const SizedBox();
    }
    bool isGrouped = items.length > widget.maxItem;
    List<AvatarGroupItemModel> filterItems =
        List.from(items.getRange(0, widget.maxItem), growable: true);
    if (isGrouped) {
      filterItems.add(AvatarGroupItemModel(
          name: '+${items.length - filterItems.length}', isExtent: true));
    }

    return Row(
      children: filterItems.map(
        (item) {
          return Align(
            widthFactor: 0.75,
            child: CustomCircularAvatar(
              name: item.name,
              url: item.url,
              avatarSize: widget.size,
              isExtendValue: item.isExtent,
              showBorder: true,
            ),
          );
        },
      ).toList(),
    );
  }
}
