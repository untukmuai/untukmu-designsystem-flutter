import 'package:flutter/material.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

part 'models/custom_switch_model.dart';

class CustomSwitchWidget extends StatefulWidget {
  const CustomSwitchWidget({
    super.key,
    required this.items,
    this.onSwitchChanged,
    this.label = '',
    this.isMandatory = false,
    this.isOptional = false,
    this.minWidth,
    this.divider,
    this.children = const [],
  });

  final List<CustomSwitchModel> items;
  final Function(int index)? onSwitchChanged;

  final String label;
  final bool isMandatory;
  final bool isOptional;

  final double? minWidth;

  final Widget? divider;

  /// Child widgets corresponding to each switch item
  final List<Widget> children;

  @override
  State<CustomSwitchWidget> createState() => _CustomSwitchWidgetState();
}

class _CustomSwitchWidgetState extends State<CustomSwitchWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Visibility(
          visible: widget.label.isNotEmpty,
          child: Row(
            children: [
              LabelWidget(label: widget.label, labelType: LabelType.normal),
              const SizedBox(width: 8),
              Visibility(
                  visible: widget.isMandatory,
                  child: const LabelWidget(
                      label: "Mandatory", labelType: LabelType.mandatory)),
              const SizedBox(width: 8),
              Visibility(
                  visible: widget.isOptional,
                  child: const LabelWidget(
                      label: "Optional", labelType: LabelType.optional)),
            ],
          ),
        ),
        SizedBox(height: widget.label.isNotEmpty ? 4 : 0),
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
              color: DLSColors.bgSoft200,
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              widget.items.length,
              (index) => InkWell(
                onTap: () {
                  if (widget.onSwitchChanged != null) {
                    widget.onSwitchChanged!(index);
                  }
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  constraints: BoxConstraints(minWidth: widget.minWidth ?? 0),
                  margin: EdgeInsets.only(
                      right: index != (widget.items.length - 1) ? 4 : 0),
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 32),
                  decoration: BoxDecoration(
                    color: selectedIndex == index ? Colors.white : null,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: selectedIndex == index
                        ? [
                            BoxShadow(
                              offset: const Offset(0, 2),
                              blurRadius: 4,
                              spreadRadius: 0,
                              color: const Color(0xFF1B1C1D)
                                  .withValues(alpha: 0.02),
                            ),
                            BoxShadow(
                              offset: const Offset(0, 6),
                              blurRadius: 10,
                              spreadRadius: 0,
                              color: const Color(0xFF1B1C1D)
                                  .withValues(alpha: 0.06),
                            ),
                          ]
                        : null,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.items[index].title,
                        style: DLSTextStyle.labelMedium.copyWith(
                          color: selectedIndex == index
                              ? DLSColors.textMain900
                              : DLSColors.textSoft400,
                        ),
                      ),
                      if (widget.items[index].hasNotification)
                        const SizedBox(width: DLSSizing.s3xSmall),
                      if (widget.items[index].hasNotification)
                        const Icon(
                          Icons.brightness_1,
                          size: 8,
                          color: DLSColors.redBase,
                        )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        if (widget.divider != null) widget.divider!,
        if (widget.children.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: IndexedStack(
              index: selectedIndex,
              children: widget.children,
            ),
          ),
      ],
    );
  }
}
