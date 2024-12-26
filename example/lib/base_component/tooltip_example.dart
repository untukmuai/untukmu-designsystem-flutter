import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

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
                  tooltipWidget: Icon(Iconsax.information),
                ),
                CustomTooltipWidget(
                  style: TooltipStyle.dark,
                  message: 'Insert tooltip',
                  tooltipWidget: Icon(Iconsax.information),
                ),
              ],
            ),
            CustomTooltipWidget(
              mode: TooltipMode.informative,
              title: 'Insert tooltip',
              message:
                  'Insert tooltip description here. It would look much better as three lines of text.',
              tooltipWidget: Icon(Iconsax.information),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: CustomTooltipWidget(
                mode: TooltipMode.informative,
                style: TooltipStyle.dark,
                title: 'Insert tooltip',
                message:
                    'Insert tooltip description here. It would look much better as three lines of text.',
                tooltipWidget: Icon(Iconsax.information),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
