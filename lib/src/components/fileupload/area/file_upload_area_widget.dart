import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:untukmu_flutter_design_system/src/components/fileupload/area/file_upload_area_mobile_widget.dart';
import 'package:untukmu_flutter_design_system/src/components/fileupload/area/file_upload_area_web_widget.dart';

class FileUploadAreaWidget extends StatelessWidget {
  const FileUploadAreaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return const FileUploadAreaWebWidget();
    } else {
      return const FileUploadAreaMobileWidget();
    }
  }
}