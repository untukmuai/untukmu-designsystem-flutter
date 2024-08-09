import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

class ContentLabelWidget extends StatelessWidget {
  final String label;
  final String description;
  final Widget? leadingWidget;
  final VoidCallback? onTap;

  const ContentLabelWidget({
    super.key,
    required this.label,
    required this.description,
    this.leadingWidget,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 72,
      // padding: const EdgeInsets.all(16),
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        color: DLSColors.neutral0,
        boxShadow: [
          BoxShadow(
            color: Color(0x3DE4E5E7),
            blurRadius: 2,
            offset: Offset(0, 1),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (leadingWidget != null)
            Container(
              margin: const EdgeInsets.only(right: 16),
              child: leadingWidget,
            ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      label,
                      style: DLSTextStyle.labelMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: GoogleFonts.plusJakartaSans(
                    color: DLSColors.textSub500,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    // height: 0.11,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
