import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/state_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:untukmu_flutter_design_system/src/common/currency.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';
// import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

enum DropdownMode { general, country, user, paymentMethod, brand, company }

enum DropdownLabelDirection { vertical, horizontal }

class CustomDropdownWidget extends StatefulWidget {
  final String label;
  final String hintText;
  final bool isEditable;
  final bool isInvalid;
  final bool showOptionalLabel;
  final String? errorMessage;
  final TextEditingController controller;
  final DropdownLabelDirection labelDirection;
  final String? hintTextMessage;
  final DropdownMode inputMode;
  final String? dateFormat;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final String clearLabel;
  final bool enableClear;
  final String? defaultSelectedCurrency;
  final String? defaultSelectedAccess;
  final void Function(String)? onAccessSelected;
  final void Function(String)? onCurrencySelected;
  final void Function(DateTime)? onDatePicked;
  final List<TextInputFormatter>? inputFormatters;

  const CustomDropdownWidget({
    super.key,
    required this.label,
    required this.hintText,
    this.isEditable = true,
    this.isInvalid = false,
    this.errorMessage,
    required this.controller,
    this.labelDirection = DropdownLabelDirection.vertical,
    this.showOptionalLabel = false,
    this.hintTextMessage,
    this.inputMode = DropdownMode.general,
    this.dateFormat = 'DD/MM/YYYY',
    this.suffixWidget,
    this.prefixWidget,
    this.clearLabel = 'Clear',
    this.enableClear = false,
    this.defaultSelectedCurrency,
    this.defaultSelectedAccess,
    this.onAccessSelected,
    this.onCurrencySelected,
    this.onDatePicked,
    this.inputFormatters,
  });

  @override
  CustomDropdownWidgetState createState() => CustomDropdownWidgetState();
}

class CustomDropdownWidgetState extends State<CustomDropdownWidget> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;
  final RxString _text = ''.obs;
  String selectedCurrency = 'EUR'; // Default selected currency
  String selectedAccess = 'can view'; // Default selected access

  Currency getSelectedCurrency() {
    return currencyList.firstWhere(
      (currency) => currency.code == selectedCurrency,
      orElse: () => currencyList.first,
    );
  }

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });

    // Set the initial selected currency and access level
    if (widget.defaultSelectedCurrency != null) {
      selectedCurrency = widget.defaultSelectedCurrency!;
    }

    if (widget.defaultSelectedAccess != null) {
      selectedAccess = widget.defaultSelectedAccess!;
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _clearText() {
    widget.controller.clear();
  }

  Widget? _buildPrefixWidget() {
    switch (widget.inputMode) {
      default:
        return const Icon(Iconsax.flash, color: DLSColors.iconSoft400);
    }
  }

  Widget? _buildSuffixWidget() {
    switch (widget.inputMode) {
      // case InputMode.cardNumber:
      //   return const Icon(Iconsax.card_add, color: DLSColors.iconSub500);
      // case InputMode.websiteWithCounter:
      //   return Container(
      //     margin: const EdgeInsets.only(right: 8),
      //     child: Row(
      //       mainAxisSize: MainAxisSize.min,
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         const VerticalDivider(
      //           color: DLSColors.strokeSoft200,
      //           thickness: 1,
      //         ),
      //         Text('${_text.value.length}/255',
      //             style: DLSTextStyle.subheadingXSmall
      //                 .copyWith(color: DLSColors.iconSoft400)),
      //       ],
      //     ),
      //   );
      // case InputMode.amount:
      //   return Container(
      //     margin: const EdgeInsets.only(right: 8),
      //     child: Row(
      //       mainAxisSize: MainAxisSize.min,
      //       children: [
      //         const VerticalDivider(
      //           color: DLSColors.strokeSoft200,
      //           thickness: 1,
      //         ),
      //         DropdownButton<String>(
      //           value: selectedCurrency,
      //           icon: const Icon(Icons.keyboard_arrow_down),
      //           iconSize: 24,
      //           elevation: 1,
      //           dropdownColor: Colors.white,
      //           underline: Container(),
      //           items: currencyList.map((Currency currency) {
      //             return DropdownMenuItem<String>(
      //               value: currency.code,
      //               child: Row(
      //                 children: [
      //                   Container(
      //                     width: 24,
      //                     height: 24,
      //                     decoration: const BoxDecoration(
      //                       shape: BoxShape.circle,
      //                     ),
      //                     child: Center(
      //                       child: Text(currency.flag),
      //                     ),
      //                   ),
      //                   const SizedBox(width: 8),
      //                   Text(
      //                     currency.code,
      //                     style: DLSTextStyle.paragraphMedium
      //                         .copyWith(fontSize: 14),
      //                   ),
      //                 ],
      //               ),
      //             );
      //           }).toList(),
      //           onChanged: (value) {
      //             setState(() {
      //               selectedCurrency = value!;
      //             });
      //             if (widget.onCurrencySelected != null && value != null) {
      //               widget.onCurrencySelected!(value);
      //             }
      //           },
      //         ),
      //       ],
      //     ),
      //   );
      // case InputMode.date:
      //   return IconButton(
      //     icon: const Icon(Iconsax.calendar_1, color: DLSColors.iconSub500),
      //     onPressed: _showDatePicker,
      //   );
      // case InputMode.password:
      //   return IconButton(
      //     icon: Icon(
      //       _isObscured ? Iconsax.eye : Iconsax.eye_slash,
      //       color: DLSColors.iconSub500,
      //     ),
      //     onPressed: _toggleObscureText,
      //   );
      // case InputMode.shareLink:
      //   return IntrinsicWidth(
      //     child: Row(
      //       children: [
      //         const VerticalDivider(
      //           color: DLSColors.strokeSoft200,
      //           thickness: 1,
      //         ),
      //         GestureDetector(
      //           onTap: _copyToClipboard,
      //           child: const Icon(Iconsax.copy, color: DLSColors.iconSub500),
      //         ),
      //       ],
      //     ),
      //   );
      // case InputMode.invite:
      //   return Container(
      //     margin: const EdgeInsets.only(right: 8),
      //     child: Row(
      //       mainAxisSize: MainAxisSize.min,
      //       children: [
      //         const VerticalDivider(
      //           color: DLSColors.strokeSoft200,
      //           thickness: 1,
      //         ),
      //         DropdownButton<String>(
      //           value: selectedAccess,
      //           icon: const Icon(Icons.keyboard_arrow_down),
      //           iconSize: 24,
      //           elevation: 1,
      //           dropdownColor: Colors.white,
      //           underline: Container(),
      //           items: <DropdownMenuItem<String>>[
      //             DropdownMenuItem<String>(
      //               value: 'can view',
      //               child: Row(
      //                 children: [
      //                   const Icon(
      //                     Iconsax.global,
      //                     size: 16,
      //                     color: DLSColors.iconSoft400,
      //                   ),
      //                   const SizedBox(width: 8),
      //                   Text(
      //                     'can view',
      //                     style: DLSTextStyle.paragraphMedium.copyWith(
      //                         fontSize: 14, color: DLSColors.textSub500),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //             DropdownMenuItem<String>(
      //               value: 'can edit',
      //               child: Row(
      //                 children: [
      //                   const Icon(
      //                     Iconsax.edit,
      //                     size: 16,
      //                     color: DLSColors.iconSoft400,
      //                   ),
      //                   const SizedBox(width: 8),
      //                   Text('can edit',
      //                       style: DLSTextStyle.paragraphMedium.copyWith(
      //                           fontSize: 14, color: DLSColors.textSub500)),
      //                 ],
      //               ),
      //             ),
      //           ],
      //           onChanged: (value) {
      //             setState(() {
      //               selectedAccess = value!;
      //             });
      //             if (widget.onAccessSelected != null && value != null) {
      //               widget.onAccessSelected!(value);
      //             }
      //           },
      //         ),
      //       ],
      //     ),
      //   );
      default:
        return null;
    }
  }

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
    // Widget? suffixWidget = widget.suffixWidget ?? _buildSuffixWidget();

    // Combine custom inputFormatters with default ones based on InputMode
    List<TextInputFormatter> formatters = widget.inputFormatters ?? [];

    return DropdownButtonFormField(
      items: ['USD', 'IDR'].map(
        (e) {
          return DropdownMenuItem(value: e, child: Text(e));
        },
      ).toList(),
      hint: Text(
        widget.hintText,
        style: DLSTextStyle.labelSmall.copyWith(color: DLSColors.textSoft400),
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
        prefixIcon: const Icon(
          Iconsax.flash_1,
          color: DLSColors.iconSoft400,
          size: 20,
        ),
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
      onChanged: (value) {},
    );
  }

  InputBorder get border => OutlineInputBorder(
      borderRadius: DLSRadius.radius12,
      borderSide: const BorderSide(color: DLSColors.strokeSoft200));
}
