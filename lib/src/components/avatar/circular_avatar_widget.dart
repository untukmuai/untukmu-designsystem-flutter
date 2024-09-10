import 'package:flutter/material.dart';
import 'package:untukmu_flutter_design_system/src/components/avatar/constant/avatar_size.dart';
import 'package:untukmu_flutter_design_system/src/styles/text_styles.dart';

class CustomCircularAvatarWidget extends StatefulWidget {
  const CustomCircularAvatarWidget({
    super.key,
    this.avatarSize = AvatarSize.size64,
    this.url,
    this.name,
    this.showBorder = false,
    this.isExtendValue = false,
    this.icon,
    this.backgroundColor,
  });

  final String? url;
  final String? name;
  final bool showBorder;
  final bool isExtendValue;

  final Widget? icon;
  final Color? backgroundColor;

  final AvatarSize avatarSize;

  @override
  State<CustomCircularAvatarWidget> createState() =>
      _CustomCircularAvatarWidgetState();
}

class _CustomCircularAvatarWidgetState
    extends State<CustomCircularAvatarWidget> {
  @override
  Widget build(BuildContext context) {
    var avatar = CircleAvatar(
      foregroundImage: widget.url == null ? null : NetworkImage(widget.url!),
      backgroundColor: widget.backgroundColor,
      radius: widget.avatarSize.value / 2,
      child: widget.icon ??
          Text(
            widget.name ?? '',
            style: nameStyle.copyWith(
              fontSize: widget.avatarSize.value * 0.35,
            ),
          ),
    );

    if (widget.showBorder) {
      return CircleAvatar(
        radius: (widget.avatarSize.value / 2) + 2,
        backgroundColor: widget.backgroundColor ?? Colors.white,
        child: widget.icon ?? avatar,
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
