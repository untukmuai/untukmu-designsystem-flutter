import 'package:flutter/material.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    this.verticalSpace,
    this.dividerText,
    this.showLine = true,
    this.filled = false,
    this.centerWidget,
  });

  final double? verticalSpace;
  final String? dividerText;

  final bool showLine;
  final bool filled;

  final Widget? centerWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Row(
        children: [
          Visibility(
            visible: showLine,
            child: Expanded(
              child: Container(
                color: DLSColors.strokeSoft200,
                height: 1,
              ),
            ),
          ),
          centerWidget ??
              Container(
                margin: padding,
                child: Text(
                  dividerText ?? '',
                  style: DLSTextStyle.subheadingXSmall
                      .copyWith(color: DLSColors.textSoft400),
                ),
              ),
          Visibility(
            visible: showLine,
            child: Expanded(
              child: Container(
                color: DLSColors.strokeSoft200,
                height: 1,
              ),
            ),
          )
        ],
      ),
    );
  }

  Color? get backgroundColor {
    if (filled) {
      return DLSColors.bgWeak100;
    }

    return null;
  }

  EdgeInsetsGeometry get padding {
    if (filled) {
      return const EdgeInsets.symmetric(
          horizontal: DLSSizing.small, vertical: DLSSizing.s3xSmall);
    }

    if (!showLine && (dividerText ?? '').trim().isNotEmpty) {
      return const EdgeInsets.symmetric(
          horizontal: DLSSizing.s3xSmall, vertical: DLSSizing.s4xSmall);
    }

    return EdgeInsets.symmetric(
        horizontal: dividerText == null ? 0 : DLSSizing.s3xSmall,
        vertical: verticalSpace ?? 0);
  }
}
