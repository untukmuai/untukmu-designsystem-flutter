import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untukmu_flutter_design_system/src/styles/text_styles.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

enum CustomSelectionType { radio, checkbox, toggle }

class CustomSelection extends StatelessWidget {
  final String label;
  final String subLabel;
  final String description;
  final bool isActive;
  final bool isHovered;
  final bool isDisabled;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final VoidCallback? onTap;
  final CustomSelectionType controlType;

  const CustomSelection({
    super.key,
    required this.label,
    required this.subLabel,
    required this.description,
    this.isActive = false,
    this.isHovered = false,
    this.isDisabled = false,
    this.leadingIcon,
    this.trailingIcon,
    this.onTap,
    this.controlType = CustomSelectionType.radio,
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
                          Text(
                            '($subLabel)',
                            style: DLSTextStyle.paragraphSmall.copyWith(
                                height: 0.14, color: DLSColors.textSub500),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              color: DLSColors.pacificBlueLight,
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'new',
                                  textAlign: TextAlign.center,
                                  style: DLSTextStyle.paragraphSmall.copyWith(
                                      height: 0.14,
                                      color: DLSColors.textSub500),
                                ),
                              ],
                            ),
                          ),
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
                child: trailingIcon ??
                    (controlType == CustomSelectionType.radio
                        ? (isActive
                            ? Icon(Icons.radio_button_checked,
                                color: isDisabled
                                    ? DLSColors.neutral300
                                    : DLSColors.primaryBase)
                            : const Icon(Icons.radio_button_unchecked,
                                color: DLSColors.neutral300))
                        : controlType == CustomSelectionType.checkbox
                            ? (isActive
                                ? Icon(Icons.check_box,
                                    color: isDisabled
                                        ? DLSColors.neutral300
                                        : DLSColors.primaryBase)
                                : const Icon(Icons.check_box_outline_blank,
                                    color: DLSColors.neutral300))
                            : SizedBox(
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
                                    // inactiveThumbColor: DLSColors.neutral300,
                                    // materialTapTargetSize:
                                    //     MaterialTapTargetSize.shrinkWrap,
                                  ),
                                ),
                              )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
