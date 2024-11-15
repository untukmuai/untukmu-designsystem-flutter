import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/state_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

class CustomDateInputWidget extends StatefulWidget {
  final String? label;
  final String? hintText;
  final bool isEditable;
  final bool isInvalid;
  final bool showOptionalLabel;
  final TextEditingController controller;
  final LabelDirection labelDirection;
  final String? hintTextMessage;
  final String? dateFormat;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final String clearLabel;
  final bool enableClear;
  final void Function(DateTime)? onDatePicked;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChanged;
  final bool readOnly;

  const CustomDateInputWidget({
    super.key,
    this.label,
    this.hintText,
    this.isEditable = true,
    this.isInvalid = false,
    required this.controller,
    this.labelDirection = LabelDirection.vertical,
    this.showOptionalLabel = false,
    this.hintTextMessage,
    this.dateFormat = 'MM/dd/yyyy',
    this.suffixWidget,
    this.prefixWidget,
    this.clearLabel = 'Clear',
    this.enableClear = false,
    this.onDatePicked,
    this.inputFormatters,
    this.onChanged,
    this.readOnly = false,
  });

  @override
  CustomDateInputWidgetState createState() => CustomDateInputWidgetState();
}

class CustomDateInputWidgetState extends State<CustomDateInputWidget> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;
  final RxString _text = ''.obs;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _showDatePicker() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (context, child) => Theme(
        data:
            Theme.of(context).copyWith(colorScheme: const ColorScheme.light()),
        child: child!,
      ),
    );
    if (pickedDate != null) {
      String formattedDate = DateFormat(widget.dateFormat).format(pickedDate);
      widget.controller.text = formattedDate;
      if (widget.onDatePicked != null) {
        widget.onDatePicked!(pickedDate);
      }
    }
  }

  void _clearText() {
    widget.controller.clear();
  }

  Widget? _buildPrefixWidget() =>
      const Icon(Iconsax.calendar_2, color: DLSColors.iconSoft400);

  Widget? _buildSuffixWidget() => IconButton(
        icon: const Icon(Iconsax.calendar_1, color: DLSColors.iconSub500),
        onPressed: _showDatePicker,
      );

  Widget _buildTextField() {
    Widget? prefixWidget = widget.prefixWidget ?? _buildPrefixWidget();
    Widget? suffixWidget = widget.suffixWidget ?? _buildSuffixWidget();

    return TextField(
      onTap: widget.readOnly ? null : _showDatePicker,
      readOnly: true,
      controller: widget.controller,
      focusNode: _focusNode,
      enabled: widget.isEditable,
      inputFormatters: widget.inputFormatters ?? [],
      onChanged: (value) {
        _text.value = value;
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      },
      style: DLSTextStyle.paragraphSmall.copyWith(
          color: widget.isEditable
              ? DLSColors.textMain900
              : DLSColors.textDisabled300),
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.only(
            top: 16,
            bottom: 16,
            left: prefixWidget == null ? 16 : 0,
            right: suffixWidget == null ? 16 : 0),
        hintText: widget.hintText,
        hintStyle: DLSTextStyle.paragraphSmall.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: DLSColors.textSoft400),
        fillColor: widget.isEditable ? Colors.transparent : DLSColors.bgWeak100,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: widget.isInvalid
                ? DLSColors.errorBase
                : _isFocused
                    ? DLSColors.strokeStrong900
                    : DLSColors.strokeSoft200,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
              color: widget.isInvalid
                  ? DLSColors.errorBase
                  : DLSColors.primaryBase),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: widget.isInvalid
                ? DLSColors.errorBase
                : DLSColors.strokeSoft200,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: widget.isInvalid ? DLSColors.errorBase : DLSColors.bgWeak100,
          ),
        ),
        prefixIcon: prefixWidget == null
            ? null
            : SizedBox(height: 24, child: prefixWidget),
        isCollapsed: true,
        suffixIcon: suffixWidget == null
            ? null
            : SizedBox(height: 24, child: suffixWidget),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.labelDirection == LabelDirection.vertical
        ? _buildVerticalLayout()
        : _buildHorizontalLayout();
  }

  Widget _buildVerticalLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  LabelWidget(label: widget.label!),
                  if (widget.showOptionalLabel) const SizedBox(width: 4),
                  if (widget.showOptionalLabel)
                    const LabelWidget(
                        label: "Optional", labelType: LabelType.optional),
                ],
              ),
              if (widget.enableClear)
                GestureDetector(
                  onTap: _clearText,
                  child: Text(widget.clearLabel,
                      style: DLSTextStyle.labelSmall
                          .copyWith(color: DLSColors.textSub500)),
                ),
            ],
          ),
        const SizedBox(height: 8),
        _buildTextField(),
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
              if (widget.label != null)
                Row(
                  children: [
                    LabelWidget(label: widget.label!),
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
          child: _buildTextField(),
        ),
        if (widget.enableClear)
          GestureDetector(
            onTap: _clearText,
            child: Text(widget.clearLabel,
                style: DLSTextStyle.labelSmall
                    .copyWith(color: DLSColors.primaryBase)),
          ),
      ],
    );
  }
}
