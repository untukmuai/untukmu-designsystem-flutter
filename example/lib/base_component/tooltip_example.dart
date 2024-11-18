import 'package:flutter/material.dart';

import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class TooltipExamplePage extends StatefulWidget {
  const TooltipExamplePage({super.key});

  @override
  State<TooltipExamplePage> createState() => _TooltipExamplePageState();
}

class _TooltipExamplePageState extends State<TooltipExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tooltip Example'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                CustomTooltipWidget(
                  message: 'Insert tooltip',
                  tooltipWidget: Icon(IconsaxPlusLinear.information),
                ),
                CustomTooltipWidget(
                  style: TooltipStyle.dark,
                  message: 'Insert tooltip',
                  tooltipWidget: Icon(IconsaxPlusLinear.information),
                ),
              ],
            ),
            CustomTooltipWidget(
              mode: TooltipMode.informative,
              title: 'Insert tooltip',
              message:
                  'Insert tooltip description here. It would look much better as three lines of text.',
              tooltipWidget: Icon(IconsaxPlusLinear.information),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: CustomTooltipWidget(
                mode: TooltipMode.informative,
                style: TooltipStyle.dark,
                title: 'Insert tooltip',
                message:
                    'Insert tooltip description here. It would look much better as three lines of text.',
                tooltipWidget: Icon(IconsaxPlusLinear.information),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
