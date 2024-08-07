import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

class CustomTextAreaWidget extends StatefulWidget {
  final String label;
  final String hintText;
  final bool isEditable;
  final bool isInvalid;
  final String? errorMessage;
  final TextEditingController controller;
  final int maxLength;

  const CustomTextAreaWidget({
    Key? key,
    required this.label,
    required this.hintText,
    this.isEditable = true,
    this.isInvalid = false,
    this.errorMessage,
    required this.controller,
    this.maxLength = 200,
  }) : super(key: key);

  @override
  _CustomTextAreaWidgetState createState() => _CustomTextAreaWidgetState();
}

class _CustomTextAreaWidgetState extends State<CustomTextAreaWidget> {
  FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              widget.label,
              style: DLSTextStyle.labelSmall,
            ),
            SizedBox(width: 4),
            Text(
              '(Optional)',
              style:
                  DLSTextStyle.labelSmall.copyWith(color: DLSColors.textSub500),
            ),
            SizedBox(width: 4),
            Icon(Icons.info, size: 20, color: DLSColors.iconDisabled300),
          ],
        ),
        SizedBox(height: 8),
        TextField(
          controller: widget.controller,
          focusNode: _focusNode,
          maxLength: widget.maxLength,
          enabled: widget.isEditable,
          minLines: 4,
          maxLines: 10,
          style:
              TextStyle(color: widget.isEditable ? Colors.black : Colors.grey),
          decoration: InputDecoration(
            hintText: widget.hintText,
            fillColor: widget.isEditable ? Colors.white : Colors.grey.shade100,
            filled: true,
            counterText: '',
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
                color: widget.isInvalid ? DLSColors.errorBase : Colors.black,
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
                color: widget.isInvalid
                    ? DLSColors.errorBase
                    : DLSColors.strokeSoft200,
              ),
            ),
          ),
        ),
        SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.info,
                  size: 16,
                  color: widget.isInvalid
                      ? DLSColors.errorBase
                      : DLSColors.iconSoft400,
                ),
                SizedBox(width: 4),
                Text(
                  widget.isInvalid && widget.errorMessage != null
                      ? widget.errorMessage!
                      : 'This is a hint text to help user.',
                  style: DLSTextStyle.paragraphXSmall.copyWith(
                    color: widget.isInvalid
                        ? DLSColors.errorBase
                        : DLSColors.textSub500,
                  ),
                ),
              ],
            ),
            Text(
              '${widget.controller.text.length}/${widget.maxLength}',
              style: TextStyle(
                color: DLSColors.strokeSoft200,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
