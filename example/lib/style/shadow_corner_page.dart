import 'package:flutter/material.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

class ShadowCornerExamplePage extends StatefulWidget {
  const ShadowCornerExamplePage({super.key});

  @override
  State<ShadowCornerExamplePage> createState() => _ShadowCornerExamplePageState();
}

class _ShadowCornerExamplePageState extends State<ShadowCornerExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DLSColors.bgWhite0,
      appBar: AppBar(
        title: const Text('DLSShadow & Corner'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 64),
            TestContainer(
              radius: DLSRadius.radius0,
              radiusValue: '0',
              shadow: DLSShadow.xxLargeShadow,
              shadowValue: '2X-Large',
            ),
            const SizedBox(height: 64),
            TestContainer(
              radius: DLSRadius.radius4,
              radiusValue: '4',
              shadow: DLSShadow.xLargeShadow,
              shadowValue: 'X-Large',
            ),
            const SizedBox(height: 64),
            TestContainer(
              radius: DLSRadius.radius8,
              radiusValue: '8',
              shadow: DLSShadow.largeShadow,
              shadowValue: 'Large',
            ),
            const SizedBox(height: 64),
            TestContainer(
              radius: DLSRadius.radius12,
              radiusValue: '12',
              shadow: DLSShadow.mediumShadow,
              shadowValue: 'Medium',
            ),
            const SizedBox(height: 64),
            TestContainer(
              radius: DLSRadius.radius16,
              radiusValue: '16',
              shadow: DLSShadow.smallShadow,
              shadowValue: 'Small',
            ),
            const SizedBox(height: 64),
            TestContainer(
              radius: DLSRadius.radius24,
              radiusValue: '24',
              shadow: DLSShadow.xSmallShadow,
              shadowValue: 'X-Small',
            ),
            const SizedBox(height: 64),
            TestContainer(
              radius: DLSRadius.radius32,
              radiusValue: '32',
              shadow: DLSShadow.xSmallShadow,
              shadowValue: 'X-Small',
            ),
            const SizedBox(height: 64),
            TestContainer(
              radius: DLSRadius.radius40,
              radiusValue: '40',
              shadow: DLSShadow.xSmallShadow,
              shadowValue: 'X-Small',
            ),
            const SizedBox(height: 64),
          ],
        ),
      ),
    );
  }
}

class TestContainer extends StatelessWidget {
  const TestContainer({
    super.key,
    required this.radiusValue,
    required this.shadow,
    required this.shadowValue,
    required this.radius,
  });

  final BorderRadius radius;
  final BoxShadow shadow;
  final String radiusValue;
  final String shadowValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: DLSColors.bgWhite0,
        borderRadius: radius,
        border: Border.all(color: DLSColors.strokeSoft200),
        boxShadow: [shadow],
      ),
      child: Column(
        children: [
          Text('Border Radius: $radiusValue'),
          Text('shadow: $shadowValue'),
        ],
      ),
    );
  }
}
