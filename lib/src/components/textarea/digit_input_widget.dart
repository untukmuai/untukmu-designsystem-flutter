import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/state_manager.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

class CustomDigitInputWidget extends StatefulWidget {
  final TextEditingController controller;
  final bool isEditable;
  final bool isFocused;
  final bool isInvalid;
  final int maxDigit;
  final void Function(String)? onChanged;
  final void Function(String)? onInputChanged;

  const CustomDigitInputWidget({
    super.key,
    required this.controller,
    this.isEditable = true,
    this.isFocused = false,
    this.isInvalid = false,
    this.maxDigit = 1,
    this.onChanged,
    this.onInputChanged,
  });

  @override
  CustomDigitInputWidgetState createState() => CustomDigitInputWidgetState();
}

class CustomDigitInputWidgetState extends State<CustomDigitInputWidget> {
  final List<FocusNode> _focusNodes = [];
  final List<TextEditingController> _controllers = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.maxDigit; i++) {
      _focusNodes.add(FocusNode());
      _controllers.add(TextEditingController());
      _focusNodes[i].addListener(() {
        setState(() {});
      });
    }
  }

  @override
  void dispose() {
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _onDigitChanged(int index, String value) {
    if (value.isNotEmpty) {
      if (index < widget.maxDigit - 1) {
        FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
      }
    } else {
      if (index > 0) {
        FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
      }
    }

    if (widget.onChanged != null) {
      String completeInput = _controllers.map((e) => e.text).join();
      widget.onChanged!(completeInput);
    }

    if (widget.onInputChanged != null) {
      widget.onInputChanged!(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.maxDigit, (index) {
        return Padding(
          padding:
              EdgeInsets.only(right: index < widget.maxDigit - 1 ? 8.0 : 0),
          child: SizedBox(
            width: 40,
            height: 40,
            child: TextField(
              controller: _controllers[index],
              focusNode: _focusNodes[index],
              enabled: widget.isEditable,
              maxLength: 1,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              textAlign: TextAlign.center,
              style: DLSTextStyle.paragraphSmall.copyWith(
                color: widget.isEditable
                    ? DLSColors.textMain900
                    : DLSColors.textDisabled300,
              ),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                isDense: true,
                counterText: "",
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                fillColor: widget.isEditable
                    ? Colors.transparent
                    : DLSColors.bgWeak100,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: widget.isInvalid
                        ? DLSColors.errorBase
                        : _focusNodes[index].hasFocus
                            ? DLSColors.strokeStrong900
                            : DLSColors.strokeSoft200,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: widget.isInvalid
                        ? DLSColors.errorBase
                        : DLSColors.primaryBase,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: widget.isInvalid
                        ? DLSColors.errorBase
                        : DLSColors.strokeSoft200,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: widget.isInvalid
                        ? DLSColors.errorBase
                        : DLSColors.bgWeak100,
                  ),
                ),
              ),
              onChanged: (value) {
                _onDigitChanged(index, value);
              },
              onSubmitted: (_) {
                if (_controllers[index].text.isEmpty && index > 0) {
                  FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
                }
              },
            ),
          ),
        );
      }),
    );
  }
}
