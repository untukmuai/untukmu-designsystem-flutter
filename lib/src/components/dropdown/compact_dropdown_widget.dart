import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

enum CompactDropdownType { icon, text }

enum CompactDropdownSize { medium, large }

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
    this.size = CompactDropdownSize.medium,
    this.valueAlignment = Alignment.centerLeft,
    this.selectedValue,
    this.suffix,
  });

  final CompactDropdownType type;
  final CompactDropdownSize size;

  final bool enabled;
  final bool filled;
  final Color? fillColor;

  final Widget? icon;
  final double iconSize;
  final Widget? suffixIcon;

  final String? selectedValue;
  final String? hintText;
  final List<String> items;
  final AlignmentGeometry valueAlignment;

  final ValueChanged<String?>? onChanged;

  final String? suffix;

  @override
  State<CompactDropdownWidget> createState() => _CompactDropdownWidgetState();
}

class _CompactDropdownWidgetState extends State<CompactDropdownWidget> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    selectedValue = widget.selectedValue;

    bool isLarge = widget.size == CompactDropdownSize.large;
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
              alignment: widget.valueAlignment,
              padding: EdgeInsets.only(
                left: isTextType
                    ? DLSSizing.s4xSmall
                    : widget.iconSize + DLSSizing.s4xSmall,
                right: 0,
                top: isLarge ? DLSSizing.s3xSmall : 0,
                bottom: isLarge ? DLSSizing.s3xSmall : 0,
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
                      child: Text(valueBuilder(e),
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

  String valueBuilder(String value) {
    if (widget.suffix != null) {
      return '$value ${widget.suffix}';
    }

    return value;
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
