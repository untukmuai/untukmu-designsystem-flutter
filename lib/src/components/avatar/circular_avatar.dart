import 'package:flutter/material.dart';
import 'package:untukmu_flutter_design_system/src/components/avatar/constant/avatar_size.dart';
import 'package:untukmu_flutter_design_system/src/styles/text_styles.dart';

class CustomCircularAvatar extends StatefulWidget {
  const CustomCircularAvatar(
      {super.key,
      this.avatarSize = AvatarSize.size64,
      this.url,
      this.name,
      this.showBorder = false,
      this.isExtendValue = false});

  final String? url;
  final String? name;
  final bool showBorder;
  final bool isExtendValue;

  final AvatarSize avatarSize;

  @override
  State<CustomCircularAvatar> createState() => _CustomCircularAvatarState();
}

class _CustomCircularAvatarState extends State<CustomCircularAvatar> {
  @override
  Widget build(BuildContext context) {
    var avatar = CircleAvatar(
      foregroundImage: widget.url == null ? null : NetworkImage(widget.url!),
      radius: widget.avatarSize.value / 2,
      child: Text(
        widget.name ?? '',
        style: nameStyle.copyWith(
          fontSize: widget.avatarSize.value * 0.35,
        ),
      ),
    );

    if (widget.showBorder) {
      return CircleAvatar(
        radius: (widget.avatarSize.value / 2) + 2,
        backgroundColor: Colors.white,
        child: avatar,
      );
    }

    return avatar;
  }

  TextStyle get nameStyle {
    if (widget.isExtendValue) {
      switch (widget.avatarSize) {
        case AvatarSize.size80:
        case AvatarSize.size72:
        case AvatarSize.size64:
        case AvatarSize.size56:
          return DLSTextStyle.titleH3;
        case AvatarSize.size48:
        case AvatarSize.size40:
          return DLSTextStyle.labelLarge;
        case AvatarSize.size32:
        case AvatarSize.size24:
          return DLSTextStyle.labelSmall;
        case AvatarSize.size20:
          return DLSTextStyle.subheadingXSmall;
      }
    }

    return DLSTextStyle.paragraphMedium;
  }
}