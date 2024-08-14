import 'package:flutter/material.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

class DividerExamplePage extends StatefulWidget {
  const DividerExamplePage({super.key});

  @override
  State<DividerExamplePage> createState() => _DividerExamplePageState();
}

class _DividerExamplePageState extends State<DividerExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DLSColors.bgWhite0,
      appBar: AppBar(
        title: const Text('Divider'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const CustomDividerWidget(),
            const SizedBox(height: 16),
            const CustomDividerWidget(verticalSpace: DLSSizing.s5xSmall),
            const SizedBox(height: 16),
            const CustomDividerWidget(
              verticalSpace: DLSSizing.s5xSmall,
              dividerText: 'OR',
            ),
            const SizedBox(height: 16),
            const CustomDividerWidget(
              verticalSpace: DLSSizing.s5xSmall,
              dividerText: 'OR',
              showLine: false,
            ),
            const SizedBox(height: 16),
            const CustomDividerWidget(
              verticalSpace: DLSSizing.s5xSmall,
              dividerText: 'AMOUNT & ACCOUNT',
              filled: true,
              showLine: false,
            ),
            const SizedBox(height: 16),
            CustomDividerWidget(
              centerWidget: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: DLSSizing.s2xSmall),
                child: CustomButtonWidget(
                  onPressed: () {},
                  style: CustomButtonStyle.stroke,
                  label: 'Add',
                  strokeColor: DLSColors.strokeSoft200,
                  labelColor: DLSColors.textSub500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
