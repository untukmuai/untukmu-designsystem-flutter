import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

enum LabelDirection { vertical, horizontal }

class CustomTextAreaWidget extends StatefulWidget {
  final String? label;
  final String hintText;
  final bool isEditable;
  final bool isInvalid;
  final TextEditingController controller;
  final int maxLength;
  final LabelDirection labelDirection;
  final bool showOptionalLabel;
  final String? hintTextMessage;

  const CustomTextAreaWidget({
    super.key,
    this.label,
    required this.hintText,
    this.isEditable = true,
    this.isInvalid = false,
    required this.controller,
    this.maxLength = 200,
    this.labelDirection = LabelDirection.vertical,
    this.showOptionalLabel = false,
    this.hintTextMessage,
  });

  @override
  CustomTextAreaWidgetState createState() => CustomTextAreaWidgetState();
}

class CustomTextAreaWidgetState extends State<CustomTextAreaWidget> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;
  final RxString _text = ''.obs;
  int _maxLines = 4;

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
    return widget.labelDirection == LabelDirection.vertical
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
        SizedBox(
            height: widget.label != null &&
                    widget.showOptionalLabel &&
                    widget.showOptionalLabel
                ? 8
                : 0),
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
          child: _buildTextField(),
        ),
      ],
    );
  }

  Widget _buildTextField() {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        TextField(
          controller: widget.controller,
          focusNode: _focusNode,
          maxLength: widget.maxLength,
          enabled: widget.isEditable,
          minLines: 4,
          maxLines: _maxLines,
          onChanged: (value) {
            _text.value = value;
          },
          style: GoogleFonts.plusJakartaSans(
              fontWeight: FontWeight.w400,
              color: widget.isEditable
                  ? DLSColors.textMain900
                  : DLSColors.textDisabled300),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: GoogleFonts.plusJakartaSans(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: DLSColors.textSoft400),
            fillColor: widget.isEditable ? Colors.white : DLSColors.bgWeak100,
            filled: true,
            counterText: '',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: !widget.isEditable
                    ? DLSColors.bgWeak100
                    : widget.isInvalid
                        ? DLSColors.errorBase
                        : _isFocused
                            ? DLSColors.strokeSoft200
                            : DLSColors.strokeSoft200,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: widget.isInvalid
                    ? DLSColors.errorBase
                    : DLSColors.strokeStrong900,
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
                    : DLSColors.bgWeak100,
              ),
            ),
          ),
        ),
        Obx(
          () => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '${_text.value.length}/${widget.maxLength}',
                  style: DLSTextStyle.subheadingXSmall.copyWith(
                    color: DLSColors.iconSoft400,
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onPanUpdate: (details) {
                    setState(() {
                      _maxLines += details.delta.dy < 0 ? 1 : -1;
                      if (_maxLines < 4) {
                        _maxLines = 4; // Minimal sesuai dengan minLines
                      }
                      if (_maxLines > 10) _maxLines = 10; // Maksimal 10 line
                    });
                  },
                  child: Container(
                    // Tambahkan Container untuk memastikan area interaktif
                    color: Colors
                        .transparent, // Warna transparan agar tidak mengganggu tampilan
                    padding: const EdgeInsets.all(
                        8.0), // Menambahkan padding agar area interaktif lebih besar
                    child: SvgPicture.asset(
                      "packages/untukmu_flutter_design_system/assets/icons/ic_resize.svg",
                      width: 16,
                      height: 16,
                      colorFilter: const ColorFilter.mode(
                          DLSColors.iconSoft400, BlendMode.srcIn),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
