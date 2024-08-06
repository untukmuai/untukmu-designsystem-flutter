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
      body: const Column(
        children: [FileUploadAreaWidget()],
      ),
    );
  }
}
