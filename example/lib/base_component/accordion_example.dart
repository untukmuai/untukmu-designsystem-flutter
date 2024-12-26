import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

class AccordionExamplePage extends StatefulWidget {
  const AccordionExamplePage({super.key});

  @override
  State<AccordionExamplePage> createState() => _AccordionExamplePageState();
}

class _AccordionExamplePageState extends State<AccordionExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DLSColors.bgWhite0,
      appBar: AppBar(title: const Text('Accordion')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            CustomAccordionWidget(
              title: 'You\'ve got a message!',
              content:
                  'Greetings! You are special to someone and don\'t give up!',
            ),
            SizedBox(height: DLSSizing.s3xSmall),
            CustomAccordionWidget(
              prefixIcon: IconsaxPlusLinear.message,
              title: 'You\'ve got a message!',
              content:
                  'Greetings! You are special to someone and don\'t give up!',
              collapsedSuffixIcon: IconsaxPlusLinear.add,
              expandedSuffixIcon: IconsaxPlusLinear.minus,
            ),
            SizedBox(height: DLSSizing.s3xSmall),
            CustomAccordionWidget(
              prefixIcon: IconsaxPlusLinear.add,
              title: 'You\'ve got a message!',
              content:
                  'Greetings! You are special to someone and don\'t give up!',
            ),
          ],
        ),
      ),
    );
  }
}
