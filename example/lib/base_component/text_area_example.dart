import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
                  hintText: "hintText",
                  controller: controller),
              const SizedBox(height: 16),
              CustomTextAreaWidget(
                  label: "Change Label",
                  hintText: "hintText",
                  isInvalid: true,
                  controller: controller),
              const SizedBox(height: 16),
              CustomTextAreaWidget(
                  label: "Change Label",
                  hintText: "hintText",
                  isEditable: false,
                  controller: controller)
            ],
          ),
        ),
      ),
    );
  }
}
