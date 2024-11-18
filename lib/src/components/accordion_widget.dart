import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

class CustomAccordionWidget extends StatefulWidget {
  const CustomAccordionWidget({
    super.key,
    this.title = 'Insert your accordion title here',
    this.content =
        'Insert the notification description here. It would look better as two lines of text.',
    this.prefixIcon,

    /// icon for collapsed container
    /// expanded icon shouldn't null to animated the icons
    this.collapsedSuffixIcon,

    /// icon for expanded container
    /// collapsed icon shouldn't null to animated the icons
    this.expandedSuffixIcon,
  });

  final IconData? prefixIcon;
  final IconData? collapsedSuffixIcon;
  final IconData? expandedSuffixIcon;
  final String title;
  final String content;

  @override
  State<CustomAccordionWidget> createState() => _CustomAccordionWidgetState();
}

class _CustomAccordionWidgetState extends State<CustomAccordionWidget>
    with TickerProviderStateMixin {
  // control the state of the animation
  late final AnimationController _controller;

  // animation that generates value depending on tween applied
  late final Animation<double> _animation;

  // define the begin and the end value of an animation
  late final Tween<double> _sizeTween;

  // expansion state
  bool _isExpanded = false;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );
    _sizeTween = Tween(begin: 0, end: 1);
    super.initState();
  }

  void _expandOnChanged() {
    setState(() {
      _isExpanded = !_isExpanded;
      _isExpanded ? _controller.forward() : _controller.reverse();
    });
  }

  Color backgroundColor = DLSColors.bgWhite0;
  Color strokeColor = DLSColors.strokeSoft200;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool prefixNull = widget.prefixIcon == null;
    bool suffixNull =
        widget.expandedSuffixIcon == null && widget.collapsedSuffixIcon == null;

    return MouseRegion(
      onHover: _onHover,
      onExit: _onExit,
      child: GestureDetector(
        onTap: _expandOnChanged,
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: DLSRadius.radius12,
            border: Border.all(width: 1, color: strokeColor),
          ),
          child: Column(
            children: [
              Container(
                height: 56,
                width: double.infinity,
                alignment: Alignment.center,
                child: Container(
                  padding: const EdgeInsets.all(DLSSizing.xSmall),
                  child: Row(
                    children: [
                      prefixNull
                          ? const SizedBox()
                          : Icon(widget.prefixIcon, size: 24),
                      SizedBox(width: prefixNull ? 0 : DLSSizing.s2xSmall),
                      Expanded(
                        child: Text(
                          widget.title,
                          style: DLSTextStyle.labelLarge,
                        ),
                      ),
                      SizedBox(width: suffixNull ? 0 : DLSSizing.s2xSmall),
                      suffixNull
                          ? const SizedBox()
                          : AnimatedSwitcher(
                              duration: const Duration(milliseconds: 350),
                              transitionBuilder: (child, anim) =>
                                  RotationTransition(
                                turns: child.key == const ValueKey('icon1')
                                    ? Tween<double>(begin: 1, end: 0.5)
                                        .animate(anim)
                                    : Tween<double>(begin: 0.5, end: 1)
                                        .animate(anim),
                                child:
                                    ScaleTransition(scale: anim, child: child),
                              ),
                              child: _isExpanded
                                  ? const Icon(IconsaxPlusLinear.minus,
                                      size: 24, key: ValueKey('icon1'))
                                  : const Icon(IconsaxPlusLinear.add,
                                      size: 24, key: ValueKey('icon2')),
                            ),
                    ],
                  ),
                ),
              ),
              SizeTransition(
                sizeFactor: _sizeTween.animate(_animation),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(
                      DLSSizing.xSmall, 0, DLSSizing.xSmall, DLSSizing.xSmall),
                  child: Row(
                    children: [
                      SizedBox(
                          width: widget.prefixIcon == null
                              ? 0
                              : 24 + DLSSizing.s2xSmall),
                      Expanded(
                        child: Text(
                          widget.content,
                          style: DLSTextStyle.labelSmall,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onExit(PointerEvent details) {
    if (kIsWeb) {
      setState(() {
        backgroundColor = DLSColors.bgWhite0;
        strokeColor = DLSColors.strokeSoft200;
      });
    }
  }

  void _onHover(PointerEvent details) {
    if (kIsWeb) {
      setState(() {
        backgroundColor = DLSColors.bgWeak100;
        strokeColor = DLSColors.bgWeak100;
      });
    }
  }
}
