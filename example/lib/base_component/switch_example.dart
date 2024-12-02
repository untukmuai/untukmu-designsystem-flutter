import 'package:flutter/material.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSwitchWidget(
            label: 'Menu',
            items: [
              CustomSwitchModel(title: 'Label 1'),
              CustomSwitchModel(title: 'Label 2', hasNotification: true),
            ],
          ),
          CustomSwitchWidget(
            items: [
              CustomSwitchModel(title: 'Label 1'),
              CustomSwitchModel(title: 'Label 2', hasNotification: true),
            ],
          ),
        ],
      ),
    );
  }
}
