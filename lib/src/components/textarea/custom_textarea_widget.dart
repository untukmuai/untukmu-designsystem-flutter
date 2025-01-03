import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final ValueChanged<String>? onSubmitted;

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
    this.onSubmitted,
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

    _focusNode.addListener(_handleFocusChange);
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
          // Check for existing spaces before and after the current position
          final isBeforeSpace =
              currentPosition > 0 && text[currentPosition - 1] == ' ';
          final isAfterSpace =
              currentPosition < text.length && text[currentPosition] == ' ';

          if (isBeforeSpace || isAfterSpace) {
            // Do not add a space if it creates a double space
            return true; // Handled the space key without adding another space
          }

          // Add a space if it's not a double space
          final newText =
              '${text.substring(0, currentPosition)} ${text.substring(currentPosition)}';

          widget.controller.value = TextEditingValue(
            text: newText,
            selection: TextSelection.collapsed(offset: currentPosition + 1),
          );

          return true; // Handled the space key
        }
      } else if (event.logicalKey == LogicalKeyboardKey.tab) {
        // Let the default tab behavior work
        return false;
      }
    }
    return false;
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
    List<TextInputFormatter> inputFormatters = [NoDoubleSpaceFormatter()];

    return Stack(
      alignment: Alignment.bottomRight,
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
            controller: widget.controller,
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
            onSubmitted: widget.onSubmitted,
            inputFormatters: inputFormatters,
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
