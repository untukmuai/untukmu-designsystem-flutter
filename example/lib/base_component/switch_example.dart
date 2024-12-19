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
            minWidth: 150,
            items: [
              CustomSwitchModel(title: 'Label 1'),
              CustomSwitchModel(title: 'Label 2', hasNotification: true),
            ],
            children: [
              WidgetOne(),
              WidgetSecond(),
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

class WidgetOne extends StatelessWidget {
  WidgetOne({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
    );
  }
}

class WidgetSecond extends StatelessWidget {
  WidgetSecond({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
    );
  }
}
