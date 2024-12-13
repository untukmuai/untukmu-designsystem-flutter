import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

enum DropdownLabelDirection { vertical, horizontal }

class CustomDropdownWidget extends StatefulWidget {
  final CustomDropdownData? selectedItem;
  final String? label;
  final String hintText;
  final bool isEditable;
  final bool isInvalid;
  final bool showOptionalLabel;
  final DropdownLabelDirection labelDirection;
  final String? hintTextMessage;
  final bool readOnly;

  final Widget? prefixIcon;
  final List<CustomDropdownData> items;

  final ValueChanged<CustomDropdownData?>? onChanged;

  const CustomDropdownWidget({
    super.key,
    this.selectedItem,
    this.label,
    required this.hintText,
    this.isEditable = true,
    this.showOptionalLabel = false,
    this.labelDirection = DropdownLabelDirection.vertical,
    this.isInvalid = false,
    this.hintTextMessage,
    this.prefixIcon,
    required this.items,
    this.onChanged,
    this.readOnly = false,
  });

  @override
  CustomDropdownWidgetState createState() => CustomDropdownWidgetState();
}

class CustomDropdownWidgetState extends State<CustomDropdownWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.labelDirection == DropdownLabelDirection.vertical
        ? _buildVerticalLayout()
        : _buildHorizontalLayout();
  }

  Widget _buildVerticalLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (widget.label != null) LabelWidget(label: widget.label!),
            if (widget.showOptionalLabel) const SizedBox(width: 4),
            if (widget.showOptionalLabel)
              const LabelWidget(
                  label: "Optional", labelType: LabelType.optional),
          ],
        ),
        const SizedBox(height: 8),
        _buildDropdown(),
        const SizedBox(height: 4),
        if (widget.hintTextMessage != null)
          HintTextWidget(
              hint: widget.hintTextMessage!,
              hintState: widget.isInvalid ? HintState.error : HintState.normal),
      ],
    );
  }

  Widget _buildHorizontalLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (widget.label != null) LabelWidget(label: widget.label!),
                  if (widget.showOptionalLabel) const SizedBox(width: 4),
                  if (widget.showOptionalLabel)
                    const LabelWidget(
                        label: "Optional", labelType: LabelType.optional),
                ],
              ),
              const SizedBox(height: 16),
              if (widget.hintTextMessage != null)
                HintTextWidget(
                    hint: widget.hintTextMessage!,
                    hintState:
                        widget.isInvalid ? HintState.error : HintState.normal),
            ],
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 3,
          child: _buildDropdown(),
        ),
      ],
    );
  }

  Widget _buildDropdown() {
    return DropdownButtonFormField<CustomDropdownData?>(
      value: widget.selectedItem,
      isExpanded: true,
      items: widget.items.map(
        (e) {
          return DropdownMenuItem(value: e, child: Text(e.name));
        },
      ).toList(),
      hint: Text(
        widget.hintText,
        style: DLSTextStyle.labelSmall.copyWith(color: DLSColors.textSoft400),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      style: DLSTextStyle.labelSmall.copyWith(color: DLSColors.textMain900),
      icon: const Padding(
        padding: EdgeInsets.only(left: DLSSizing.s3xSmall),
        child: Icon(
          Iconsax.arrow_down_1,
          size: 20,
          color: DLSColors.iconSoft400,
        ),
      ),
      decoration: InputDecoration(
        enabled: widget.isEditable,
        isCollapsed: true,
        prefixIcon: widget.prefixIcon,
        contentPadding: const EdgeInsets.all(DLSSizing.s2xSmall),
        border: border,
        errorBorder: border.copyWith(
            borderSide: const BorderSide(color: DLSColors.redBase)),
        enabledBorder: border,
        focusedBorder: border.copyWith(
            borderSide: const BorderSide(color: DLSColors.primaryBase)),
        disabledBorder: InputBorder.none,
        focusedErrorBorder: border.copyWith(
            borderSide: const BorderSide(color: DLSColors.errorBase)),
        fillColor: widget.isEditable ? DLSColors.bgWhite0 : DLSColors.bgWeak100,
        filled: true,
      ),
      onChanged: widget.readOnly
          ? null
          : widget.isEditable
              ? (value) {
                  if (widget.onChanged != null) {
                    widget.onChanged!(value);
                  }
                }
              : null,
    );
  }

  InputBorder get border => OutlineInputBorder(
      borderRadius: DLSRadius.radius12,
      borderSide: const BorderSide(color: DLSColors.strokeSoft200));
}

class CustomDropdownData {
  final String code;
  final String name;

  CustomDropdownData({
    required this.code,
    required this.name,
  });
}
