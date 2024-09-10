import 'package:flutter/material.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

enum CustomProductTagColor { purple, grey }

enum CustomProductTagSize { medium, small }

class CustomProductTagWidget extends StatelessWidget {
  const CustomProductTagWidget({
    super.key,
    this.text = 'Tag',
    this.selected = false,
    this.disabled = false,
    this.showImage = true,
    this.tagColor = CustomProductTagColor.purple,
    this.tagSize = CustomProductTagSize.medium,
    this.backgroundColor,
    this.textColor,
  });

  final bool selected;
  final bool disabled;
  final bool showImage;

  final CustomProductTagColor tagColor;
  final CustomProductTagSize tagSize;

  final String text;

  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: DLSRadius.radiusFull, color: bgColor),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: DLSRadius.radiusFull,
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
              borderRadius: DLSRadius.radiusFull,
              border: borderColor != null
                  ? Border.all(width: 1, color: borderColor!)
                  : null,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Visibility(
                  visible: showImage,
                  child: Container(
                    margin: const EdgeInsets.only(right: DLSSizing.s3xSmall),
                    child: CustomCircularAvatarWidget(
                      avatarSize: avatarSize,
                      backgroundColor: DLSColors.bgSoft200,
                    ),
                  ),
                ),
                Text(text, style: tagStyle),
              ],
            ),
          ),
        ),
      ),
    );
  }

  EdgeInsets get padding {
    if (showImage) {
      return const EdgeInsets.fromLTRB(DLSSizing.s4xSmall, DLSSizing.s4xSmall,
          DLSSizing.xSmall, DLSSizing.s4xSmall);
    } else {
      if (tagSize == CustomProductTagSize.medium) {
        return const EdgeInsets.symmetric(
            horizontal: DLSSizing.xSmall, vertical: DLSSizing.s2xSmall);
      } else {
        return const EdgeInsets.symmetric(
            horizontal: DLSSizing.xSmall, vertical: DLSSizing.s3xSmall);
      }
    }
  }

  TextStyle get tagStyle {
    if (tagSize == CustomProductTagSize.medium) {
      return DLSTextStyle.labelSmall.copyWith(color: txtColor);
    } else {
      return DLSTextStyle.labelXSmall.copyWith(color: txtColor);
    }
  }

  AvatarSize get avatarSize {
    if (tagSize == CustomProductTagSize.medium) {
      return AvatarSize.size32;
    } else {
      return AvatarSize.size24;
    }
  }

  Color? get bgColor {
    if (disabled) {
      return DLSColors.bgSoft200;
    }

    if (backgroundColor != null) {
      return backgroundColor;
    }

    if (selected) {
      if (tagColor == CustomProductTagColor.purple) {
        return DLSColors.primaryLighter;
      } else {
        return DLSColors.bgStrong900;
      }
    }

    return null;
  }

  Color? get borderColor {
    if (disabled) {
      return null;
    }

    if (backgroundColor != null) {
      return null;
    }

    if (selected) {
      if (tagColor == CustomProductTagColor.purple) {
        return DLSColors.primaryBase;
      } else {
        return null;
      }
    }

    return DLSColors.strokeSoft200;
  }

  Color? get txtColor {
    if (disabled) {
      return DLSColors.textDisabled300;
    }

    if (textColor != null) {
      return textColor;
    }

    if (tagColor == CustomProductTagColor.purple) {
      if (selected) {
        return DLSColors.primaryBase;
      }

      return DLSColors.primaryBase;
    } else {
      if (selected) {
        return DLSColors.textWhite0;
      }

      return DLSColors.textMain900;
    }
  }
}
