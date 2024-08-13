import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

enum CompactDropdownType { icon, text }

class CompactDropdownWidget extends StatefulWidget {
  const CompactDropdownWidget({
    super.key,
    this.enabled = true,
    this.filled = false,
    this.fillColor,
    this.hintText,
    required this.items,
    this.onChanged,
    this.icon,
    this.iconSize = 20,
    this.suffixIcon,
    this.type = CompactDropdownType.text,
  });

  final CompactDropdownType type;

  final bool enabled;
  final bool filled;
  final Color? fillColor;

  final Widget? icon;
  final double iconSize;
  final Widget? suffixIcon;

  final String? hintText;
  final List<String> items;

  final ValueChanged<String?>? onChanged;

  @override
  State<CompactDropdownWidget> createState() => _CompactDropdownWidgetState();
}

class _CompactDropdownWidgetState extends State<CompactDropdownWidget> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    bool isTextType = widget.type == CompactDropdownType.text;

    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: DLSSizing.s3xSmall, vertical: DLSSizing.s4xSmall),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: DLSRadius.radius12,
        border:
            widget.enabled ? Border.all(color: DLSColors.strokeSoft200) : null,
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          if (!isTextType)
            widget.icon ??
                Icon(
                  Icons.language,
                  size: widget.iconSize,
                  color: prefixColor,
                ),
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedValue,
              isDense: true,
              padding: EdgeInsets.only(
                left: isTextType ? 0 : widget.iconSize + DLSSizing.s4xSmall,
                right: DLSSizing.s5xSmall,
                top: DLSSizing.s3xSmall,
                bottom: DLSSizing.s3xSmall,
              ),
              style: DLSTextStyle.labelMedium.copyWith(color: textColor),
              hint: Text(
                widget.hintText ?? '',
                style: DLSTextStyle.labelMedium.copyWith(color: textColor),
              ),
              icon: Padding(
                padding: const EdgeInsets.only(left: DLSSizing.s3xSmall),
                child: widget.suffixIcon ??
                    Icon(
                      Iconsax.arrow_down_1,
                      size: 20,
                      color: suffixColor,
                    ),
              ),
              items: widget.items
                  .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e,
                          style: DLSTextStyle.labelMedium
                              .copyWith(color: textColor))))
                  .toList(),
              onChanged: !widget.enabled
                  ? null
                  : (value) {
                      setState(() {
                        selectedValue = value;
                      });

                      if (widget.onChanged != null) {
                        widget.onChanged!(value);
                      }
                    },
            ),
          ),
        ],
      ),
    );
  }

  Color? get backgroundColor {
    if (!widget.filled || widget.fillColor == null) {
      return null;
    }

    if (!widget.enabled) {
      return DLSColors.bgWeak100;
    }

    return widget.fillColor;
  }

  Color get textColor {
    if (widget.enabled) {
      return DLSColors.textSub500;
    }

    return DLSColors.textDisabled300;
  }

  Color get prefixColor {
    if (widget.enabled) {
      return DLSColors.iconSoft400;
    }

    return DLSColors.iconDisabled300;
  }

  Color get suffixColor {
    if (widget.enabled) {
      return DLSColors.iconSub500;
    }

    return DLSColors.iconDisabled300;
  }
}