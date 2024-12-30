import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/state_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:untukmu_flutter_design_system/src/common/currency.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

enum InputMode {
  text,
  phoneNumber,
  cardNumber,
  website,
  amount,
  date,
  password,
  shareLink,
  invite,
  websiteWithCounter,
  tag,
  counter,
}

class CustomTextInputWidget extends StatefulWidget {
  final String? label;
  final String? hintText;
  final bool isEditable;
  final bool isInvalid;
  final bool showOptionalLabel;
  final bool showOptionalWithoutIconLabel;
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
  final String? defaultSelectedCurrency;
  final String? defaultSelectedAccess;
  final void Function(String)? onAccessSelected;
  final void Function(String)? onCurrencySelected;
  final void Function(DateTime)? onDatePicked;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChanged;
  final bool readOnly;

  // Parameter untuk mode tag
  final List<String>? listTag;
  final bool enableAddNew;
  final void Function(List<String>)? onTagsChanged;
  final ValueChanged<String>? onSubmitted;

  final bool enableCurrencyFormat; // Whether to enable IDR currency formatting
  final bool allowNegative; // Whether to allow negative numbers

  const CustomTextInputWidget({
    super.key,
    this.label,
    this.hintText,
    this.isEditable = true,
    this.isInvalid = false,
    this.errorMessage,
    required this.controller,
    this.labelDirection = LabelDirection.vertical,
    this.showOptionalLabel = false,
    this.showOptionalWithoutIconLabel = false,
    this.hintTextMessage,
    this.inputMode = InputMode.text,
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
    this.listTag,
    this.enableAddNew = false,
    this.onTagsChanged,
    this.onChanged,
    this.readOnly = false,
    this.onSubmitted,
    this.enableCurrencyFormat = false,
    this.allowNegative = false,
  });

  @override
  CustomTextInputWidgetState createState() => CustomTextInputWidgetState();
}

class CustomTextInputWidgetState extends State<CustomTextInputWidget> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;
  bool _isObscured = true;
  final RxString _text = ''.obs;
  String selectedCurrency = 'USD'; // Default selected currency
  String selectedAccess = 'can view'; // Default selected access
  List<String>? listTag;
  int _counterValue = 0;
  Country selectedCountry = countryList.first; // Default selected country

  Country getSelectedCurrency() {
    return countryList.firstWhere(
      (currency) => currency.code == selectedCurrency,
      orElse: () => countryList.first,
    );
  }

  final NumberFormat _currencyFormatter = NumberFormat.currency(
    locale: 'id_ID',
    symbol: '',
    decimalDigits: 0,
  );

  String? _formatCurrencyInput(String text) {
    if (!widget.enableCurrencyFormat) return text;

    if (text.isEmpty) return text;

    // Remove all non-digit characters except minus sign
    String cleanText = text.replaceAll(RegExp(r'[^0-9-]'), '');

    try {
      // Handle negative numbers
      bool isNegative = cleanText.startsWith('-');
      if (isNegative && !widget.allowNegative) {
        cleanText = cleanText.substring(1);
        isNegative = false;
      }

      // Parse the cleaned text to integer
      int? value = int.tryParse(cleanText.replaceAll('-', ''));
      if (value == null) return text;

      // Format the number with IDR currency formatting
      String formatted = _currencyFormatter.format(isNegative ? -value : value);

      return formatted;
    } catch (e) {
      return text;
    }
  }

  // Function to extract numeric value from formatted string
  String _getNumericValue(String formattedText) {
    return formattedText.replaceAll(RegExp(r'[^0-9-]'), '');
  }

  @override
  void initState() {
    super.initState();
    if (widget.listTag != null && widget.listTag!.isNotEmpty) {
      setState(() {
        listTag = [];
        listTag!.addAll(widget.listTag!);
      });
    }
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });

    _focusNode.addListener(_handleFocusChange);

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
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();

    super.dispose();
  }

  void _handleFocusChange() {
    if (_focusNode.hasFocus) {
      // Re-attach keyboard handlers when focus is gained
      ServicesBinding.instance.keyboard.addHandler(_handleKeyPress);
    } else {
      // Remove handlers when focus is lost
      ServicesBinding.instance.keyboard.removeHandler(_handleKeyPress);
    }
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  bool _handleKeyPress(KeyEvent event) {
    if (!_focusNode.hasFocus) return false;

    if (event is KeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.space) {
        final currentPosition = widget.controller.selection.baseOffset;
        final text = widget.controller.text;

        if (currentPosition >= 0) {
          final newText =
              '${text.substring(0, currentPosition)} ${text.substring(currentPosition)}';

          widget.controller.value = TextEditingValue(
            text: newText,
            selection: TextSelection.collapsed(offset: currentPosition + 1),
          );

          if (widget.onChanged != null) {
            widget.onChanged!(newText);
          }

          return true; // Handled the space key
        }
      } else if (event.logicalKey == LogicalKeyboardKey.tab) {
        // Let the default tab behavior work
        return false;
      }
    }
    return false;
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
      if (widget.onDatePicked != null) {
        widget.onDatePicked!(pickedDate);
      }
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

  void _decrementCounter() {
    _counterValue = int.tryParse(widget.controller.text) ?? 0;
    setState(() {
      if (_counterValue > 0) {
        _counterValue--;
      }
    });
    widget.controller.text = _counterValue.toString();
  }

  void _incrementCounter() {
    _counterValue = int.tryParse(widget.controller.text) ?? 0;
    setState(() {
      _counterValue++;
    });
    widget.controller.text = _counterValue.toString();
  }

  Widget? _buildPrefixWidget() {
    switch (widget.inputMode) {
      case InputMode.phoneNumber:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 16),
              child: DropdownButton<Country>(
                value: selectedCountry,
                icon: const Icon(Icons.keyboard_arrow_down,
                    color: DLSColors.iconSoft400),
                iconSize: 24,
                elevation: 1,
                dropdownColor: Colors.white,
                underline: Container(),
                items: countryList.map((Country country) {
                  return DropdownMenuItem<Country>(
                    value: country,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(country.flag,
                            style: const TextStyle(fontSize: 16)),
                        const SizedBox(width: 8),
                        Text(
                          country.phoneCode,
                          style: DLSTextStyle.paragraphMedium.copyWith(
                            color: DLSColors.textMain900,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (Country? newCountry) {
                  setState(() {
                    selectedCountry = newCountry!;
                  });
                },
              ),
            ),
            const VerticalDivider(
              color: DLSColors.strokeSoft200,
              thickness: 1,
            ),
          ],
        );
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
        return SizedBox(
          width: 12,
          height: 12,
          child: Center(
            child: Text(
              getSelectedCurrency().symbol,
              style: DLSTextStyle.paragraphMedium.copyWith(
                color: DLSColors.iconSoft400,
                fontSize: 14,
              ),
            ),
          ),
        );
      case InputMode.date:
        return const Icon(Iconsax.calendar_2, color: DLSColors.iconSoft400);
      case InputMode.password:
        return const Icon(Iconsax.lock_1, color: DLSColors.iconSoft400);
      case InputMode.shareLink:
        return const Icon(Iconsax.link, color: DLSColors.iconSoft400);
      case InputMode.invite:
        return const Icon(Iconsax.user, color: DLSColors.iconSoft400);
      case InputMode.counter:
        return IconButton(
          icon: const Icon(Icons.remove, color: DLSColors.iconSoft400),
          onPressed: _decrementCounter,
        );
      default:
        return widget.prefixWidget;
    }
  }

  Widget? _buildSuffixWidget() {
    switch (widget.inputMode) {
      case InputMode.tag:
        if (widget.enableAddNew) {
          return InkWell(
            onTap: () {
              setState(() {
                if (widget.controller.text.isNotEmpty) {
                  listTag?.add(widget.controller.text);
                  widget.controller.clear();
                  if (widget.onTagsChanged != null) {
                    widget.onTagsChanged!(listTag!);
                  }
                }
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Add New",
                    style:
                        DLSTextStyle.labelXSmall.copyWith(color: Colors.white),
                  ),
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 16,
                  )
                ],
              ),
            ),
          );
        }
        break;
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
                value: selectedCurrency,
                icon: const Icon(Icons.keyboard_arrow_down),
                iconSize: 24,
                elevation: 1,
                dropdownColor: Colors.white,
                underline: Container(),
                items: countryList.map((Country currency) {
                  return DropdownMenuItem<String>(
                    value: currency.code,
                    child: Row(
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(currency.flag),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          currency.code,
                          style: DLSTextStyle.paragraphMedium
                              .copyWith(fontSize: 14),
                        ),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCurrency = value!;
                  });
                  if (widget.onCurrencySelected != null && value != null) {
                    widget.onCurrencySelected!(value);
                  }
                },
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
          icon: Icon(
            _isObscured ? Iconsax.eye : Iconsax.eye_slash,
            color: DLSColors.iconSub500,
          ),
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
                value: selectedAccess,
                icon: const Icon(Icons.keyboard_arrow_down),
                iconSize: 24,
                elevation: 1,
                dropdownColor: Colors.white,
                underline: Container(),
                items: <DropdownMenuItem<String>>[
                  DropdownMenuItem<String>(
                    value: 'can view',
                    child: Row(
                      children: [
                        const Icon(
                          Iconsax.global,
                          size: 16,
                          color: DLSColors.iconSoft400,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'can view',
                          style: DLSTextStyle.paragraphMedium.copyWith(
                              fontSize: 14, color: DLSColors.textSub500),
                        ),
                      ],
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: 'can edit',
                    child: Row(
                      children: [
                        const Icon(
                          Iconsax.edit,
                          size: 16,
                          color: DLSColors.iconSoft400,
                        ),
                        const SizedBox(width: 8),
                        Text('can edit',
                            style: DLSTextStyle.paragraphMedium.copyWith(
                                fontSize: 14, color: DLSColors.textSub500)),
                      ],
                    ),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedAccess = value!;
                  });
                  if (widget.onAccessSelected != null && value != null) {
                    widget.onAccessSelected!(value);
                  }
                },
              ),
            ],
          ),
        );
      case InputMode.counter:
        return IconButton(
          icon: const Icon(Icons.add, color: DLSColors.iconSoft400),
          onPressed: _incrementCounter,
        );
      default:
        return null;
    }
    return null;
  }

  Widget _buildTagWidget() {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: listTag?.map((tag) {
                  return CustomTagWidget(
                    label: tag,
                    suffixIcon: Iconsax.close_circle,
                    onTap: () {
                      setState(() {
                        listTag!.remove(tag);
                        if (widget.onTagsChanged != null) {
                          widget.onTagsChanged!(listTag!);
                        }
                      });
                    },
                  );
                }).toList() ??
                [],
          ),
        ],
      ),
    );
  }

  Widget _buildTextField() {
    Widget? prefixWidget = widget.prefixWidget ?? _buildPrefixWidget();
    Widget? suffixWidget = widget.suffixWidget ?? _buildSuffixWidget();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Focus(
          focusNode: _focusNode,
          onKeyEvent: (node, event) {
            if (_handleKeyPress(event)) {
              return KeyEventResult.handled;
            }
            return KeyEventResult.ignored;
          },
          child: TextField(
            readOnly: widget.readOnly,
            controller: widget.controller,
            enabled: widget.isEditable,
            inputFormatters: widget.enableCurrencyFormat
                ? [
                    FilteringTextInputFormatter.allow(widget.allowNegative
                        ? RegExp(r'[0-9-]')
                        : RegExp(r'[0-9]')),
                    // Add any custom formatters from widget.inputFormatters
                    ...?widget.inputFormatters,
                  ]
                : widget.inputFormatters ?? [],
            obscureText:
                widget.inputMode == InputMode.password ? _isObscured : false,
            keyboardType: widget.enableCurrencyFormat
                ? TextInputType.number
                : (widget.inputMode == InputMode.website ||
                        widget.inputMode == InputMode.shareLink)
                    ? TextInputType.url
                    : widget.inputMode == InputMode.phoneNumber
                        ? TextInputType.phone
                        : (widget.inputMode == InputMode.cardNumber ||
                                widget.inputMode == InputMode.amount ||
                                widget.inputMode == InputMode.date)
                            ? TextInputType.number
                            : TextInputType.text,
            onChanged: (value) {
              if (widget.enableCurrencyFormat) {
                // Get cursor position before formatting
                int cursorPosition = widget.controller.selection.baseOffset;
                String oldValue = widget.controller.text;

                // Remove any existing formatting
                String cleanValue = value.replaceAll(RegExp(r'[^0-9-]'), '');

                // Format the new value
                String formattedValue = '';
                if (cleanValue.isNotEmpty) {
                  try {
                    int numericValue = int.parse(cleanValue);
                    formattedValue = _currencyFormatter.format(numericValue);
                  } catch (e) {
                    formattedValue = oldValue;
                  }
                }

                // Calculate new cursor position
                int newPosition = cursorPosition;
                if (formattedValue.length > oldValue.length) {
                  newPosition += formattedValue.length - oldValue.length;
                }

                // Immediately invoke onChanged with the clean numeric value
                if (widget.onChanged != null) {
                  widget.onChanged!(cleanValue);
                }

                // Update the text field
                if (formattedValue != value) {
                  widget.controller.value = TextEditingValue(
                    text: formattedValue,
                    selection: TextSelection.collapsed(
                        offset: newPosition.clamp(0, formattedValue.length)),
                  );
                }

                _text.value = formattedValue;
              } else {
                _text.value = value;
                if (widget.onChanged != null) {
                  widget.onChanged!(value);
                }
              }
            },
            textAlign: widget.inputMode == InputMode.counter
                ? TextAlign.center
                : TextAlign.left,
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
              fillColor:
                  widget.isEditable ? Colors.transparent : DLSColors.bgWeak100,
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
                  color: widget.isInvalid
                      ? DLSColors.errorBase
                      : DLSColors.bgWeak100,
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
            onSubmitted: widget.onSubmitted,
          ),
        ),
        if (widget.inputMode == InputMode.tag) _buildTagWidget()
      ],
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
                  if (widget.showOptionalLabel ||
                      widget.showOptionalWithoutIconLabel)
                    const SizedBox(width: 4),
                  if (widget.showOptionalLabel ||
                      widget.showOptionalWithoutIconLabel)
                    LabelWidget(
                        label: "Optional",
                        labelType: widget.showOptionalLabel
                            ? LabelType.optional
                            : LabelType.optionalWithouIcon),
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
                    if (widget.showOptionalLabel ||
                        widget.showOptionalWithoutIconLabel)
                      const SizedBox(width: 4),
                    if (widget.showOptionalLabel ||
                        widget.showOptionalWithoutIconLabel)
                      LabelWidget(
                          label: "Optional",
                          labelType: widget.showOptionalLabel
                              ? LabelType.optional
                              : LabelType.optionalWithouIcon),
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
