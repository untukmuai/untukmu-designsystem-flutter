import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/state_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

enum InputMode {
  phoneNumber,
  cardNumber,
  website,
  amount,
  date,
  password,
  shareLink,
  invite,
  websiteWithCounter
}

class CustomTextInputWidget extends StatefulWidget {
  final String label;
  final String hintText;
  final bool isEditable;
  final bool isInvalid;
  final bool showOptionalLabel;
  final String? errorMessage;
  final TextEditingController controller;
  final LabelDirection labelDirection;
  final String? hintTextMessage;
  final InputMode inputMode;
  final String? dateFormat;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final String clearLabel;
  final bool enableClear;

  const CustomTextInputWidget({
    super.key,
    required this.label,
    required this.hintText,
    this.isEditable = true,
    this.isInvalid = false,
    this.errorMessage,
    required this.controller,
    this.labelDirection = LabelDirection.vertical,
    this.showOptionalLabel = false,
    this.hintTextMessage,
    this.inputMode = InputMode.website,
    this.dateFormat = 'DD/MM/YYYY',
    this.suffixWidget,
    this.prefixWidget,
    this.clearLabel = 'Clear',
    this.enableClear = false,
  });

  @override
  CustomTextInputWidgetState createState() => CustomTextInputWidgetState();
}

class CustomTextInputWidgetState extends State<CustomTextInputWidget> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;
  bool _isObscured = true;
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

  void _toggleObscureText() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  void _showDatePicker() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      String formattedDate = DateFormat(widget.dateFormat).format(pickedDate);
      widget.controller.text = formattedDate;
    }
  }

  void _copyToClipboard() {
    Clipboard.setData(ClipboardData(text: widget.controller.text));
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Copied to clipboard'),
    ));
  }

  void _clearText() {
    widget.controller.clear();
  }

  Widget? _buildPrefixWidget() {
    switch (widget.inputMode) {
      case InputMode.phoneNumber:
        return const Icon(Iconsax.user, color: DLSColors.iconSoft400);
      case InputMode.cardNumber:
        return const Icon(Iconsax.card, color: DLSColors.iconSoft400);
      case InputMode.website:
        return SizedBox(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12, top: 8, bottom: 12),
                child: Text('https://', style: DLSTextStyle.labelMedium),
              ),
              const VerticalDivider(
                color: DLSColors.strokeSoft200,
                thickness: 1,
              )
            ],
          ),
        );
      case InputMode.amount:
        return const Icon(Icons.euro_symbol, color: DLSColors.iconSoft400);
      case InputMode.date:
        return const Icon(Iconsax.calendar_2, color: DLSColors.iconSoft400);
      case InputMode.password:
        return const Icon(Iconsax.lock_1, color: DLSColors.iconSoft400);
      case InputMode.shareLink:
        return const Icon(Iconsax.link, color: DLSColors.iconSoft400);
      case InputMode.invite:
        return const Icon(Iconsax.user, color: DLSColors.iconSoft400);
      default:
        return null;
    }
  }

  Widget? _buildSuffixWidget() {
    switch (widget.inputMode) {
      case InputMode.cardNumber:
        return const Icon(Iconsax.card_add, color: DLSColors.iconSub500);
      case InputMode.websiteWithCounter:
        return Container(
          margin: const EdgeInsets.only(right: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const VerticalDivider(
                color: DLSColors.strokeSoft200,
                thickness: 1,
              ),
              Text('${_text.value.length}/255',
                  style: DLSTextStyle.subheadingXSmall
                      .copyWith(color: DLSColors.iconSoft400)),
            ],
          ),
        );
      case InputMode.amount:
        return Container(
          margin: const EdgeInsets.only(right: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const VerticalDivider(
                color: DLSColors.strokeSoft200,
                thickness: 1,
              ),
              DropdownButton<String>(
                value: 'EUR',
                items: <String>['EUR', 'USD', 'JPY', 'GBP'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
            ],
          ),
        );
      case InputMode.date:
        return IconButton(
          icon: const Icon(Iconsax.calendar_1, color: DLSColors.iconSub500),
          onPressed: _showDatePicker,
        );
      case InputMode.password:
        return IconButton(
          icon: Icon(_isObscured ? Iconsax.eye : Iconsax.eye_slash,
              color: DLSColors.iconSub500),
          onPressed: _toggleObscureText,
        );
      case InputMode.shareLink:
        return IntrinsicWidth(
          child: Row(
            children: [
              const VerticalDivider(
                color: DLSColors.strokeSoft200,
                thickness: 1,
              ),
              GestureDetector(
                onTap: _copyToClipboard,
                child: const Icon(Iconsax.copy, color: DLSColors.iconSub500),
              ),
            ],
          ),
        );
      case InputMode.invite:
        return DropdownButton<String>(
          value: 'can view',
          items: <String>['can view', 'can edit'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (_) {},
        );
      default:
        return null;
    }
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                LabelWidget(label: widget.label),
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
              Row(
                children: [
                  LabelWidget(label: widget.label),
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

  Widget _buildTextField() {
    Widget? prefixWidget = widget.prefixWidget ?? _buildPrefixWidget();
    Widget? suffixWidget = widget.suffixWidget ?? _buildSuffixWidget();
    return TextField(
      controller: widget.controller,
      focusNode: _focusNode,
      enabled: widget.isEditable,
      obscureText: widget.inputMode == InputMode.password ? _isObscured : false,
      keyboardType: (widget.inputMode == InputMode.website ||
              widget.inputMode == InputMode.shareLink)
          ? TextInputType.url
          : widget.inputMode == InputMode.phoneNumber
              ? TextInputType.phone
              : (widget.inputMode == InputMode.cardNumber ||
                      widget.inputMode == InputMode.amount)
                  ? TextInputType.number
                  : TextInputType.text,
      onChanged: (value) {
        _text.value = value;
      },
      style: DLSTextStyle.paragraphSmall.copyWith(
          color: widget.isEditable
              ? DLSColors.textMain900
              : DLSColors.textDisabled300),
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.only(
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
            color:
                widget.isInvalid ? DLSColors.errorBase : DLSColors.primaryBase,
          ),
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
            : SizedBox(
                height: 24,
                child: widget.prefixWidget ?? _buildPrefixWidget(),
              ),
        isCollapsed: true,
        suffixIcon: suffixWidget == null
            ? null
            : SizedBox(
                height: 24,
                child: widget.suffixWidget ?? _buildSuffixWidget(),
              ),
      ),
    );
  }
}
