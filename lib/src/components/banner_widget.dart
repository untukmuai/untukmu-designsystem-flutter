import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

enum CustomBannerType { error, warning, success, information, feature }

enum CustomBannerStyle { filled, light, lighter, stroke }

class CustomBannerWidget extends StatelessWidget {
  const CustomBannerWidget({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    this.title,
    this.content,
    this.subtitle,
    this.onDismiss,
    this.style = CustomBannerStyle.filled,
    this.type = CustomBannerType.information,
  });

  final CustomBannerType type;
  final CustomBannerStyle style;

  final IconData? prefixIcon;
  final IconData? suffixIcon;

  final String? title;
  final String? content;
  final String? subtitle;

  final VoidCallback? onDismiss;

  @override
  Widget build(BuildContext context) {
    final ComponentStyles componentStyles =
        ComponentStyles(type: type, style: style);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: componentStyles.backgroundColor,
        borderRadius: DLSRadius.radius12,
        border: componentStyles.border,
      ),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            child: Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                if (icon != null)
                  Icon(
                    icon,
                    color: componentStyles.iconColor,
                    size: 20,
                  ),
                if (title != null)
                  Container(
                    margin: const EdgeInsets.only(left: DLSSizing.s3xSmall),
                    child: Text(
                      title!,
                      style: DLSTextStyle.labelMedium
                          .copyWith(color: componentStyles.textColor),
                    ),
                  ),
                if (content != null)
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: DLSSizing.s3xSmall),
                    child: Icon(
                      Icons.brightness_1,
                      size: 5,
                      color: componentStyles.contentColor,
                    ),
                  ),
                if (content != null)
                  Container(
                    margin: const EdgeInsets.only(right: DLSSizing.s3xSmall),
                    child: Text(
                      content!,
                      style: DLSTextStyle.labelMedium
                          .copyWith(color: componentStyles.contentColor),
                    ),
                  ),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: DLSTextStyle.labelSmall
                        .copyWith(color: componentStyles.textColor),
                  ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: DLSSizing.s3xSmall),
            child: CompactButtonWidget(
              onTap: () {
                if (onDismiss != null) {
                  onDismiss!;
                }
              },
              icon: Icons.close,
              type: CompactButtonType.stroke,
              iconColor: componentStyles.suffixIconColor,
            ),
          )
        ],
      ),
    );
  }

  IconData? get icon {
    if (prefixIcon != null) {
      return prefixIcon;
    }

    switch (type) {
      case CustomBannerType.error:
      case CustomBannerType.information:
        return IconsaxPlusLinear.info_circle;
      case CustomBannerType.warning:
        return IconsaxPlusLinear.danger;
      case CustomBannerType.success:
        return IconsaxPlusLinear.tick_circle;
      case CustomBannerType.feature:
        return IconsaxPlusLinear.magic_star;
      default:
        return null;
    }
  }
}

class ComponentStyles {
  Color iconColor = DLSColors.iconWhite0;
  Color textColor = DLSColors.textWhite0;
  Color contentColor = DLSColors.textWhite0;
  Color backgroundColor = DLSColors.primaryBase;
  Color suffixIconColor = DLSColors.iconWhite0;
  Border? border;

  ComponentStyles(
      {required CustomBannerType type, required CustomBannerStyle style}) {
    switch (style) {
      case CustomBannerStyle.light:
        switch (type) {
          case CustomBannerType.error:
            iconColor = DLSColors.errorDark;
            textColor = DLSColors.errorDark;
            contentColor = DLSColors.errorDark;
            suffixIconColor = DLSColors.errorDark;
            backgroundColor = DLSColors.errorLight;
            break;
          case CustomBannerType.warning:
            iconColor = DLSColors.warningDark;
            textColor = DLSColors.warningDark;
            contentColor = DLSColors.warningDark;
            suffixIconColor = DLSColors.warningDark;
            backgroundColor = DLSColors.warningLight;
            break;
          case CustomBannerType.success:
            iconColor = DLSColors.successDark;
            textColor = DLSColors.successDark;
            contentColor = DLSColors.successDark;
            suffixIconColor = DLSColors.successDark;
            backgroundColor = DLSColors.successLight;
            break;
          case CustomBannerType.information:
            iconColor = DLSColors.informationDark;
            textColor = DLSColors.informationDark;
            contentColor = DLSColors.informationDark;
            suffixIconColor = DLSColors.informationDark;
            backgroundColor = DLSColors.informationLight;
            break;
          case CustomBannerType.feature:
            iconColor = DLSColors.iconStrong900;
            textColor = DLSColors.textMain900;
            contentColor = DLSColors.textSub500;
            suffixIconColor = DLSColors.iconSub500;
            backgroundColor = DLSColors.bgSoft200;
            break;
        }
        break;
      case CustomBannerStyle.lighter:
        textColor = DLSColors.textMain900;
        contentColor = DLSColors.textSub500;
        suffixIconColor = DLSColors.iconSoft400;
        switch (type) {
          case CustomBannerType.error:
            iconColor = DLSColors.errorBase;
            backgroundColor = DLSColors.errorLighter;
            break;
          case CustomBannerType.warning:
            iconColor = DLSColors.warningBase;
            backgroundColor = DLSColors.warningLighter;
            break;
          case CustomBannerType.success:
            iconColor = DLSColors.successBase;
            backgroundColor = DLSColors.successLighter;
            break;
          case CustomBannerType.information:
            iconColor = DLSColors.informationBase;
            backgroundColor = DLSColors.informationLighter;
            break;
          case CustomBannerType.feature:
            iconColor = DLSColors.iconStrong900;
            backgroundColor = DLSColors.bgWeak100;
            break;
        }
        break;
      case CustomBannerStyle.stroke:
        border = const Border(
            bottom: BorderSide(width: 1, color: DLSColors.strokeSoft200));
        textColor = DLSColors.textMain900;
        contentColor = DLSColors.textSub500;
        backgroundColor = DLSColors.bgWhite0;
        suffixIconColor = DLSColors.iconSoft400;
        switch (type) {
          case CustomBannerType.error:
            iconColor = DLSColors.errorBase;
            break;
          case CustomBannerType.warning:
            iconColor = DLSColors.warningBase;
            break;
          case CustomBannerType.success:
            iconColor = DLSColors.successBase;
            break;
          case CustomBannerType.information:
            iconColor = DLSColors.informationBase;
            break;
          case CustomBannerType.feature:
            iconColor = DLSColors.iconStrong900;
            break;
        }
        break;
      default:
        switch (type) {
          case CustomBannerType.error:
            backgroundColor = DLSColors.errorBase;
            break;
          case CustomBannerType.warning:
            backgroundColor = DLSColors.warningBase;
            break;
          case CustomBannerType.success:
            backgroundColor = DLSColors.successBase;
            break;
          case CustomBannerType.information:
            backgroundColor = DLSColors.informationBase;
            break;
          case CustomBannerType.feature:
            backgroundColor = DLSColors.iconStrong900;
            break;
        }
    }
  }
}
