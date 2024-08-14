import 'package:el_tooltip/el_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

enum TooltipStyle { light, dark }

enum TooltipMode { text, informative }

class CustomTooltipWidget extends StatefulWidget {
  const CustomTooltipWidget({
    super.key,
    this.style = TooltipStyle.light,
    this.mode = TooltipMode.text,
    this.icon = Icons.info,
    this.title,
    required this.message,
    required this.tooltipWidget,
    this.position = ElTooltipPosition.bottomCenter,
  });

  final TooltipStyle style;
  final TooltipMode mode;

  final IconData icon;
  final String? title;
  final String message;

  final ElTooltipPosition position;
  final Widget tooltipWidget;

  @override
  State<CustomTooltipWidget> createState() => _CustomTooltipWidgetState();
}

class _CustomTooltipWidgetState extends State<CustomTooltipWidget> {
  final ElTooltipController controller = ElTooltipController();

  @override
  Widget build(BuildContext context) {
    return ElTooltip(
      controller: controller,
      position: widget.position,
      radius: const Radius.circular(4),
      content: content,
      padding: const EdgeInsets.symmetric(
        horizontal: DLSSizing.s3xSmall,
        vertical: DLSSizing.s3xSmall,
      ),
      color: backgroundColor,
      child: widget.tooltipWidget,
    );
  }

  Widget get content {
    if (widget.mode == TooltipMode.text) {
      return Text(
        widget.message,
        style: DLSTextStyle.paragraphSmall.copyWith(color: textColor),
      );
    } else {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
                borderRadius: DLSRadius.radiusFull,
                border: Border.all(color: borderColor)),
            child: Icon(
              widget.icon,
              size: 20,
              color: iconColor,
            ),
          ),
          const SizedBox(width: DLSSizing.s2xSmall),
          Expanded(
            child: RichText(
              text: TextSpan(
                text: widget.title,
                children: [
                  const TextSpan(text: '\n'),
                  const WidgetSpan(
                      child: Padding(padding: EdgeInsets.only(top: 20))),
                  TextSpan(
                    text: widget.message,
                    style: DLSTextStyle.paragraphSmall.copyWith(
                      color: subtextColor,
                      height: 16 / 12,
                    ),
                  )
                ],
                style: DLSTextStyle.labelMedium.copyWith(color: textColor),
              ),
            ),
          ),
          const SizedBox(width: DLSSizing.s2xSmall),
          GestureDetector(
            onTap: () => controller.hide(),
            child: SizedBox(
              width: 32,
              height: 32,
              child: Icon(
                Icons.close,
                size: 20,
                color: iconColor,
              ),
            ),
          ),
        ],
      );
    }
  }

  Color get backgroundColor {
    if (widget.style == TooltipStyle.light) {
      return DLSColors.bgWhite0;
    } else {
      return DLSColors.bgSurface700;
    }
  }

  Color get textColor {
    if (widget.style == TooltipStyle.light) {
      return DLSColors.textMain900;
    } else {
      return DLSColors.textWhite0;
    }
  }

  Color get subtextColor {
    if (widget.mode == TooltipMode.text) {
      return textColor;
    } else {
      if (widget.style == TooltipStyle.light) {
        return DLSColors.textSub500;
      } else {
        return DLSColors.textDisabled300;
      }
    }
  }

  Color get iconColor {
    if (widget.style == TooltipStyle.light) {
      return DLSColors.iconSub500;
    } else {
      return DLSColors.iconSoft400;
    }
  }

  Color get borderColor {
    if (widget.style == TooltipStyle.light) {
      return DLSColors.strokeSoft200;
    } else {
      return DLSColors.neutral600;
    }
  }
}
