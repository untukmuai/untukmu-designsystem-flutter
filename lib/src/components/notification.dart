import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:untukmu_flutter_design_system/src/common/radius.dart';
import 'package:untukmu_flutter_design_system/src/common/sizing.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

enum NotificationSize { xsmall, small, large }

enum NotificationType { error, warning, success, info, feature }

enum NotificationColor { filled, light, lighter, stroke }

class CustomNotification extends StatelessWidget {
  const CustomNotification({
    super.key,
    this.size = NotificationSize.small,
    this.type = NotificationType.feature,
    this.color = NotificationColor.filled,
    this.title = 'Insert your alert title here!',
    this.subtitle =
        'Insert the alert description here. It would look better as two lines of text.',
    this.upgradeIconPath,
  });

  final NotificationSize size;
  final NotificationType type;
  final NotificationColor color;
  final String title;
  final String subtitle;

  final String? upgradeIconPath;

  @override
  Widget build(BuildContext context) {
    if (size != NotificationSize.large) {
      return smallNotification;
    }
    return largeNotification;
  }

  Widget get smallNotification => Container(
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          border: color == NotificationColor.stroke
              ? Border.all(color: DLSColors.strokeSoft200, width: 1)
              : null,
          color: backgroundColor,
        ),
        child: Row(
          children: [
            Icon(icons, size: iconSize, color: prefixIconColor),
            const SizedBox(width: DLSSizing.s3xSmall),
            Expanded(
              child: Text(
                title,
                style: DLSTextStyle.paragraphSmall.copyWith(color: textColor),
              ),
            ),
            const SizedBox(width: DLSSizing.s3xSmall),
            Row(
              children: [
                Text(
                  'Upgrade',
                  style: DLSTextStyle.labelSmall.copyWith(color: textColor),
                ),
                SizedBox(
                    width: upgradeIconPath != null ? DLSSizing.s4xSmall : 0),
                upgradeIconPath != null
                    ? SvgPicture.asset(
                        upgradeIconPath!,
                        width: iconSize,
                        height: iconSize,
                        colorFilter:
                            ColorFilter.mode(shareIconColor, BlendMode.srcIn),
                      )
                    : const SizedBox(),
              ],
            ),
            const SizedBox(width: DLSSizing.s3xSmall),
            Icon(
              Iconsax.close_square,
              size: iconSize,
              color: suffixIconColor,
            )
          ],
        ),
      );

  Widget get largeNotification => Container(
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: backgroundColor,
        border: color == NotificationColor.stroke
            ? Border.all(color: DLSColors.strokeSoft200, width: 1)
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icons, size: iconSize, color: prefixIconColor),
              const SizedBox(width: DLSSizing.s3xSmall),
              Expanded(
                child: Text(
                  title,
                  style: DLSTextStyle.labelMedium.copyWith(color: textColor),
                ),
              ),
              const SizedBox(width: DLSSizing.s3xSmall),
              Icon(
                Iconsax.close_square,
                size: iconSize,
                color: suffixIconColor,
              )
            ],
          ),
          const SizedBox(height: DLSSizing.s3xSmall),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: iconSize + DLSSizing.s3xSmall),
            child: Text(
              subtitle,
              style: DLSTextStyle.labelSmall.copyWith(color: subtextColor),
            ),
          ),
          const SizedBox(height: DLSSizing.xSmall),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: iconSize + DLSSizing.s3xSmall),
            child: Row(
              children: [
                Text(
                  'Upgrade',
                  style: DLSTextStyle.labelSmall.copyWith(color: textColor),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: DLSSizing.s3xSmall),
                  child: Text(
                    '∙',
                    style: DLSTextStyle.labelSmall.copyWith(color: textColor),
                  ),
                ),
                Text(
                  'Learn more',
                  style: DLSTextStyle.labelSmall.copyWith(color: textColor),
                ),
              ],
            ),
          ),
        ],
      ));

  BorderRadius get borderRadius {
    switch (size) {
      case NotificationSize.large:
        return DLSRadius.radius12;
      default:
        return DLSRadius.radius8;
    }
  }

  EdgeInsetsGeometry get padding {
    switch (size) {
      case NotificationSize.large:
        return const EdgeInsets.symmetric(
            vertical: DLSSizing.s2xSmall, horizontal: DLSSizing.xSmall);
      case NotificationSize.small:
        return const EdgeInsets.symmetric(
            vertical: DLSSizing.s3xSmall, horizontal: DLSSizing.s2xSmall);
      default:
        return const EdgeInsets.all(DLSSizing.s3xSmall);
    }
  }

  Color get backgroundColor {
    switch (type) {
      case NotificationType.error:
        switch (color) {
          case NotificationColor.light:
            return DLSColors.errorLight;
          case NotificationColor.lighter:
            return DLSColors.errorLighter;
          case NotificationColor.stroke:
            return DLSColors.bgWhite0;
          default:
            return DLSColors.errorBase;
        }
      case NotificationType.warning:
        switch (color) {
          case NotificationColor.light:
            return DLSColors.warningLight;
          case NotificationColor.lighter:
            return DLSColors.warningLighter;
          case NotificationColor.stroke:
            return DLSColors.bgWhite0;
          default:
            return DLSColors.warningBase;
        }
      case NotificationType.success:
        switch (color) {
          case NotificationColor.light:
            return DLSColors.successLight;
          case NotificationColor.lighter:
            return DLSColors.successLighter;
          case NotificationColor.stroke:
            return DLSColors.bgWhite0;
          default:
            return DLSColors.successBase;
        }
      case NotificationType.info:
        switch (color) {
          case NotificationColor.light:
            return DLSColors.informationLight;
          case NotificationColor.lighter:
            return DLSColors.informationLighter;
          case NotificationColor.stroke:
            return DLSColors.bgWhite0;
          default:
            return DLSColors.informationBase;
        }
      default:
        switch (color) {
          case NotificationColor.light:
            return DLSColors.bgSoft200;
          case NotificationColor.lighter:
            return DLSColors.bgWeak100;
          case NotificationColor.stroke:
            return DLSColors.bgWhite0;
          default:
            return DLSColors.bgSurface700;
        }
    }
  }

  IconData get icons {
    switch (type) {
      case NotificationType.error:
        return Iconsax.info_circle;
      case NotificationType.warning:
        return Iconsax.danger;
      case NotificationType.success:
        return Iconsax.tick_circle;
      case NotificationType.info:
        return Iconsax.info_circle;
      default:
        return Iconsax.magic_star;
    }
  }

  double get iconSize {
    switch (size) {
      case NotificationSize.xsmall:
        return 16;
      default:
        return 20;
    }
  }

  Color get textColor {
    switch (color) {
      case NotificationColor.filled:
        return DLSColors.bgWhite0;
      case NotificationColor.light:
        switch (type) {
          case NotificationType.error:
            return DLSColors.redDarker;
          case NotificationType.info:
            return DLSColors.pacificBlueDarker;
          case NotificationType.warning:
            return DLSColors.yellowDarker;
          case NotificationType.success:
            return DLSColors.greenDarker;
          default:
            return DLSColors.textMain900;
        }
      default:
        return DLSColors.textMain900;
    }
  }

  Color get subtextColor {
    switch (color) {
      case NotificationColor.filled:
        return DLSColors.bgWhite0;
      case NotificationColor.light:
        switch (type) {
          case NotificationType.error:
            return DLSColors.redDarker;
          case NotificationType.info:
            return DLSColors.pacificBlueDarker;
          case NotificationType.warning:
            return DLSColors.yellowDarker;
          case NotificationType.success:
            return DLSColors.greenDarker;
          default:
            return DLSColors.textMain900;
        }
      default:
        return DLSColors.textSub500;
    }
  }

  Color get prefixIconColor {
    switch (color) {
      case NotificationColor.light:
        switch (type) {
          case NotificationType.error:
            return DLSColors.redDarker;
          case NotificationType.info:
            return DLSColors.pacificBlueDarker;
          case NotificationType.warning:
            return DLSColors.yellowDarker;
          case NotificationType.success:
            return DLSColors.greenDarker;
          default:
            return DLSColors.textMain900;
        }
      case NotificationColor.lighter:
      case NotificationColor.stroke:
        switch (type) {
          case NotificationType.error:
            return DLSColors.redBase;
          case NotificationType.info:
            return DLSColors.pacificBlueBase;
          case NotificationType.warning:
            return DLSColors.yellowBase;
          case NotificationType.success:
            return DLSColors.greenBase;
          default:
            return DLSColors.iconSub500;
        }
      default:
        return DLSColors.bgWhite0;
    }
  }

  Color get suffixIconColor {
    switch (color) {
      case NotificationColor.light:
        switch (type) {
          case NotificationType.error:
            return DLSColors.redDarker;
          case NotificationType.info:
            return DLSColors.pacificBlueDarker;
          case NotificationType.warning:
            return DLSColors.yellowDarker;
          case NotificationType.success:
            return DLSColors.greenDarker;
          default:
            return DLSColors.textMain900;
        }
      case NotificationColor.lighter:
        return DLSColors.iconSub500;
      case NotificationColor.stroke:
        return DLSColors.iconSoft400;
      default:
        return DLSColors.bgWhite0;
    }
  }

  Color get shareIconColor {
    switch (color) {
      case NotificationColor.light:
        switch (type) {
          case NotificationType.error:
            return DLSColors.redDarker;
          case NotificationType.info:
            return DLSColors.pacificBlueDarker;
          case NotificationType.warning:
            return DLSColors.yellowDarker;
          case NotificationType.success:
            return DLSColors.greenDarker;
          default:
            return DLSColors.textMain900;
        }
      case NotificationColor.stroke:
      case NotificationColor.lighter:
        return DLSColors.iconSoft400;
      default:
        return DLSColors.bgWhite0;
    }
  }
}
