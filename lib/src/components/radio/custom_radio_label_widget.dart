import 'package:flutter/material.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

enum RadioPosition { start, end }

class CustomRadioLabelWidget extends StatefulWidget {
  const CustomRadioLabelWidget({
    super.key,
    required this.label,
    this.sublabel,
    this.badgetLabel,
    this.description,
    this.linkButtonLabel,
    this.onLinkTap,
    this.isActive = false,
    this.isDisabled = false,
    this.radioPosition = RadioPosition.start,
    this.widthConstraint = double.infinity,
  });

  final String label;
  final String? sublabel;
  final String? badgetLabel;
  final String? description;
  final String? linkButtonLabel;
  final VoidCallback? onLinkTap;

  final bool isActive;
  final bool isDisabled;
  final RadioPosition radioPosition;

  final double widthConstraint;

  @override
  State<CustomRadioLabelWidget> createState() => _CustomRadioLabelWidgetState();
}

class _CustomRadioLabelWidgetState extends State<CustomRadioLabelWidget> {
  final double size = 16;

  late bool isSelected;

  @override
  void initState() {
    isSelected = widget.isActive;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.widthConstraint,
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.radioPosition == RadioPosition.start)
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: InkWell(
                    borderRadius: DLSRadius.radiusFull,
                    onTap: widget.isDisabled
                        ? null
                        : () => setState(() {
                              isSelected = !isSelected;
                            }),
                    child: radioWidget(),
                  ),
                ),
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
              if (widget.radioPosition == RadioPosition.end)
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: widget.isDisabled
                      ? null
                      : InkWell(
                          borderRadius: DLSRadius.radiusFull,
                          onTap: () => setState(() {
                            isSelected = !isSelected;
                          }),
                          child: radioWidget(),
                        ),
                ),
            ],
          ),
          if (widget.description != null)
            Container(
              margin: EdgeInsets.only(
                left:
                    widget.radioPosition == RadioPosition.start ? size + 10 : 0,
                top: 4,
                right:
                    widget.radioPosition == RadioPosition.end ? size + 10 : 0,
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
                left:
                    widget.radioPosition == RadioPosition.start ? size + 10 : 0,
                top: 12,
                right:
                    widget.radioPosition == RadioPosition.end ? size + 10 : 0,
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

  Widget radioWidget() {
    if (!isSelected && widget.isDisabled) {
      // DISABLED
      return Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: DLSRadius.radiusFull,
          color: DLSColors.bgSoft200,
          border: Border.all(color: DLSColors.strokeSub300),
        ),
      );
    } else if (isSelected && !widget.isDisabled) {
      // ACTIVE
      return Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: DLSRadius.radiusFull,
          color: DLSColors.primaryBase,
          border: Border.all(color: DLSColors.primaryDark),
        ),
        child: Container(
          width: size * 0.5,
          height: size * 0.5,
          decoration: BoxDecoration(
            borderRadius: DLSRadius.radiusFull,
            color: DLSColors.bgWhite0,
            boxShadow: const [
              DLSShadow.radioShadow,
              DLSShadow.radioDotActive,
            ],
          ),
        ),
      );
    } else if (isSelected && widget.isDisabled) {
      // ACTIVE DISABLED
      return Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: DLSRadius.radiusFull,
          color: DLSColors.bgSoft200,
          border: Border.all(color: DLSColors.strokeSub300),
        ),
        child: Container(
          width: size * 0.5,
          height: size * 0.5,
          decoration: BoxDecoration(
            borderRadius: DLSRadius.radiusFull,
            color: DLSColors.bgWhite0,
          ),
        ),
      );
    } else {
      return Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: DLSRadius.radiusFull,
          color: DLSColors.bgSoft200,
        ),
        child: Container(
          width: size * 0.8125,
          height: size * 0.8125,
          decoration: BoxDecoration(
            borderRadius: DLSRadius.radiusFull,
            color: DLSColors.bgWhite0,
            boxShadow: const [
              DLSShadow.radioShadow,
            ],
          ),
        ),
      );
    }
  }
}
