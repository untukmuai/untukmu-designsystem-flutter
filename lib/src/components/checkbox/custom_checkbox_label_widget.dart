import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

enum CheckboxPosition { start, end }

enum CheckboxActiveState { unchecked, checked, indeterminate }

class CustomCheckboxLabelWidget extends StatefulWidget {
  const CustomCheckboxLabelWidget({
    super.key,
    required this.label,
    this.size = 16,
    this.sublabel,
    this.badgetLabel,
    this.description,
    this.linkButtonLabel,
    this.onLinkTap,
    this.isDisabled = false,
    this.checkboxPosition = CheckboxPosition.start,
    this.widthConstraint = double.infinity,
    this.checkboxActiveState = CheckboxActiveState.unchecked,
    this.withInderteminate = true,
    this.onChanged,
  });

  final double size;

  final String label;
  final String? sublabel;
  final String? badgetLabel;
  final String? description;
  final String? linkButtonLabel;
  final VoidCallback? onLinkTap;

  final CheckboxActiveState checkboxActiveState;
  final bool isDisabled;
  final CheckboxPosition checkboxPosition;

  final double widthConstraint;
  final bool withInderteminate;

  final ValueChanged<CheckboxActiveState>? onChanged;

  @override
  State<CustomCheckboxLabelWidget> createState() =>
      _CustomCheckboxLabelWidgetState();
}

class _CustomCheckboxLabelWidgetState extends State<CustomCheckboxLabelWidget> {
  late CheckboxActiveState state;

  @override
  void initState() {
    state = widget.checkboxActiveState;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.widthConstraint,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // if (widget.checkboxPosition == CheckboxPosition.start)
              //   checkboxWidget(),
              Expanded(
                child: Row(
                  children: [
                    Text(
                      widget.label,
                      style: DLSTextStyle.labelMedium,
                    ),
                    if (widget.sublabel != null)
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          '(${widget.sublabel ?? ''})',
                          style: DLSTextStyle.paragraphSmall
                              .copyWith(color: DLSColors.textSub500),
                        ),
                      ),
                    if (widget.badgetLabel != null)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          color: DLSColors.pacificBlueLight,
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              widget.badgetLabel ?? '',
                              textAlign: TextAlign.center,
                              style: DLSTextStyle.paragraphSmall.copyWith(
                                  height: 0.14, color: DLSColors.textSub500),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              // if (widget.checkboxPosition == CheckboxPosition.end)
              //   checkboxWidget(),
            ]..insert(
                widget.checkboxPosition == CheckboxPosition.start ? 0 : 1,
                checkboxWidget(
                    widget.checkboxPosition == CheckboxPosition.start ? 0 : 1),
              ),
          ),
          if (widget.description != null)
            Container(
              margin: EdgeInsets.only(
                left: widget.checkboxPosition == CheckboxPosition.start
                    ? widget.size + 10
                    : 0,
                top: 4,
                right: widget.checkboxPosition == CheckboxPosition.end
                    ? widget.size + 10
                    : 0,
              ),
              child: Text(
                widget.description ?? '',
                style: DLSTextStyle.paragraphSmall
                    .copyWith(color: DLSColors.textSub500),
              ),
            ),
          if (widget.linkButtonLabel != null)
            Container(
              margin: EdgeInsets.only(
                left: widget.checkboxPosition == CheckboxPosition.start
                    ? widget.size + 10
                    : 0,
                top: 12,
                right: widget.checkboxPosition == CheckboxPosition.end
                    ? widget.size + 10
                    : 0,
              ),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: widget.onLinkTap,
                  child: Text(
                    widget.linkButtonLabel ?? '',
                    style: DLSTextStyle.labelSmall
                        .copyWith(color: DLSColors.primaryBase),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget checkboxWidget(int index) {
    return Container(
      margin: EdgeInsets.only(
          left: index == 1 ? 10 : 0, right: index == 0 ? 10 : 0),
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
        onTap: widget.isDisabled
            ? null
            : () {
                setState(() {
                  switch (state) {
                    case CheckboxActiveState.checked:
                      if (widget.withInderteminate) {
                        state = CheckboxActiveState.indeterminate;
                      } else {
                        state = CheckboxActiveState.unchecked;
                      }
                      break;
                    case CheckboxActiveState.indeterminate:
                      state = CheckboxActiveState.unchecked;
                      break;
                    case CheckboxActiveState.unchecked:
                      state = CheckboxActiveState.checked;
                      break;
                  }
                });

                if (widget.onChanged != null) {
                  widget.onChanged!(state);
                }
              },
        child: _buildCheckboxState(),
      ),
    );
  }

  Widget _buildCheckboxState() {
    IconData? icon;

    switch (state) {
      case CheckboxActiveState.checked:
        icon = Icons.check;
        break;
      case CheckboxActiveState.indeterminate:
        icon = Iconsax.minus;
        break;
      default:
        icon = null;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
        color: widget.isDisabled
            ? DLSColors.bgSoft200
            : icon == null
                ? null
                : DLSColors.primaryBase,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: widget.isDisabled
              ? DLSColors.strokeSub300
              : icon == null
                  ? DLSColors.bgSoft200
                  : DLSColors.primaryDark,
          width: 1.5,
        ),
      ),
      child: Center(
        child: Icon(
          icon,
          size: widget.size * 0.5,
          color: Colors.white,
        ),
      ),
    );
  }
}
