import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

class TextAreaExample extends StatefulWidget {
  const TextAreaExample({super.key});

  @override
  State<TextAreaExample> createState() => _TextAreaExampleState();
}

class _TextAreaExampleState extends State<TextAreaExample> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DLSColors.bgWhite0,
      appBar: AppBar(
        title: const Text('Text Area Example'),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              CustomTextAreaWidget(
                  label: "Change Label",
                  hintText: "Placeholder text...",
                  showOptionalLabel: true,
                  hintTextMessage: "tes",
                  controller: controller),
              const SizedBox(height: 16),
              if (kIsWeb)
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: CustomTextAreaWidget(
                      label: "Change Label",
                      hintText: "Placeholder text...",
                      labelDirection: LabelDirection.horizontal,
                      showOptionalLabel: true,
                      controller: controller),
                ),
              CustomTextAreaWidget(
                  label: "Change Label",
                  hintText: "Placeholder text...",
                  isInvalid: true,
                  hintTextMessage: "tes",
                  controller: controller),
              const SizedBox(height: 16),
              CustomTextAreaWidget(
                  label: "Change Label",
                  hintText: "Placeholder text...",
                  isEditable: false,
                  controller: controller)
            ],
          ),
        ),
      ),
    );
  }
}
