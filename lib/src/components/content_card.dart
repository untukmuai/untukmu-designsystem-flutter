import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

enum ContentCardType { none, radio, checkbox, toggle }

class ContentCard extends StatelessWidget {
  final String label;
  final String description;
  final bool isActive;
  final bool isHovered;
  final bool isDisabled;
  final String? subLabel;
  final Widget? badge;
  final Widget? leadingIcon;
  final Widget? trailingWidget;
  final VoidCallback? onTap;
  final ContentCardType controlType;

  const ContentCard({
    super.key,
    required this.label,
    required this.description,
    this.subLabel,
    this.isActive = false,
    this.isHovered = false,
    this.isDisabled = false,
    this.leadingIcon,
    this.trailingWidget,
    this.badge,
    this.onTap,
    this.controlType = ContentCardType.none,
  });

  @override
  Widget build(BuildContext context) {
    Color borderColor = (isActive && !isDisabled)
        ? DLSColors.primaryBase
        : isHovered
            ? DLSColors.bgWeak100
            : DLSColors.neutral200;
    Color backgroundColor =
        isHovered ? DLSColors.neutral100 : DLSColors.neutral0;

    return GestureDetector(
      onTap: () {
        if (!isDisabled && onTap != null) {
          onTap!();
        }
      },
      child: Opacity(
        opacity: isDisabled ? 0.48 : 1,
        child: Container(
          height: 72,
          padding: const EdgeInsets.all(16),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: backgroundColor,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: borderColor),
              borderRadius: BorderRadius.circular(12),
            ),
            shadows: [
              if (!isDisabled)
                const BoxShadow(
                  color: Color(0x3DE4E5E7),
                  blurRadius: 2,
                  offset: Offset(0, 1),
                  spreadRadius: 0,
                ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (leadingIcon != null) ...[
                leadingIcon!,
                const SizedBox(width: 8),
              ],
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            label,
                            style: DLSTextStyle.labelMedium,
                          ),
                          const SizedBox(width: 8),
                          if (subLabel != null)
                            Container(
                              margin: const EdgeInsets.only(right: 8),
                              child: Text(
                                '($subLabel)',
                                style: DLSTextStyle.paragraphSmall.copyWith(
                                    height: 0.14, color: DLSColors.textSub500),
                              ),
                            ),
                          if (badge != null) badge!,
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      description,
                      style: GoogleFonts.plusJakartaSans(
                        color: DLSColors.neutral500,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        height: 0.11,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(),
                  child: actionWidget()),
            ],
          ),
        ),
      ),
    );
  }

  Widget actionWidget() {
    if (controlType == ContentCardType.none) {
      return const SizedBox();
    } else if (controlType == ContentCardType.radio) {
      return isActive
          ? Icon(
              Icons.radio_button_checked,
              color: isDisabled ? DLSColors.neutral300 : DLSColors.primaryBase,
            )
          : const Icon(
              Icons.radio_button_unchecked,
              color: DLSColors.neutral300,
            );
    } else if (controlType == ContentCardType.checkbox) {
      return isActive
          ? Icon(
              Icons.check_box,
              color: isDisabled ? DLSColors.neutral300 : DLSColors.primaryBase,
            )
          : const Icon(
              Icons.check_box_outline_blank,
              color: DLSColors.neutral300,
            );
    } else {
      return SizedBox(
        width: 32,
        height: 20,
        child: Transform.scale(
          scale: 0.6,
          child: CupertinoSwitch(
            value: isActive,
            onChanged: isDisabled
                ? null
                : (bool value) {
                    if (onTap != null) onTap!();
                  },
            activeColor: DLSColors.primaryBase,
          ),
        ),
      );
    }
  }
}
