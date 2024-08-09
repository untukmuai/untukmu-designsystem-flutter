import 'dart:io';

import 'package:flutter/material.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

class FileUploadExample extends StatelessWidget {
  const FileUploadExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DLSColors.bgWhite0,
      appBar: AppBar(
        title: const Text('File Upload Example'),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const FileUploadAreaWidget(),
              const SizedBox(height: 16),
              const ImageUploadWidget(),
              const SizedBox(height: 16),
              ImageUploadWidget(
                hideTitle: true,
                hideSubtitle: true,
                unsentIcon: Image.asset(
                  "packages/untukmu_flutter_design_system/assets/images/ic_avatar.png",
                  width: 56,
                  height: 56,
                ),
              ),
              const SizedBox(height: 16),
              ImageSelectorWidget(onImageSelected: (File file) {
                debugPrint(file.path);
              }),
              const SizedBox(height: 16),
              const ImageSelectorWidget(isLarge: false),
              const SizedBox(height: 16),
              const ImageSelectorWidget(isDisabled: true),
            ],
          ),
        ),
      ),
    );
  }
}
