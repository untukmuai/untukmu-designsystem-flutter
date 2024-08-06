import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:file_picker/file_picker.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

class FileUploadAreaWidget extends StatefulWidget {
  const FileUploadAreaWidget({super.key});

  @override
  FileUploadAreaWidgetState createState() => FileUploadAreaWidgetState();
}

class FileUploadAreaWidgetState extends State<FileUploadAreaWidget> {
  String? _fileName;
  double? _fileSize;

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;

      setState(() {
        _fileName = file.name;
        _fileSize = file.size / (1024 * 1024); // Convert bytes to MB
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          DottedBorder(
            padding: const EdgeInsets.all(16.0),
            borderType: BorderType.RRect,
            radius: const Radius.circular(12),
            color: DLSColors.strokeSub300,
            dashPattern: const [6],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Iconsax.document_upload,
                    color: DLSColors.textSub500, size: 24),
                const SizedBox(height: 16.0),
                Text(
                  'Choose a file or drag & drop it here.',
                  style: DLSTextStyle.labelMedium
                      .copyWith(color: DLSColors.textMain900),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'JPEG, PNG, PDF, and MP4 formats, up to 50 MB.',
                  style: DLSTextStyle.paragraphSmall
                      .copyWith(color: DLSColors.textSoft400),
                ),
                const SizedBox(height: 16.0),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(9999),
                    onTap: () {
                      _pickFile();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 9.5, vertical: 9),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 1, color: DLSColors.strokeSoft200),
                          borderRadius: BorderRadius.circular(9999),
                        ),
                      ),
                      child: Text(
                        'Browse File',
                        textAlign: TextAlign.center,
                        style: DLSTextStyle.labelXSmall
                            .copyWith(color: DLSColors.textSub500),
                      ),
                    ),
                  ),
                ),
                if (_fileName != null && _fileSize != null) ...[
                  const SizedBox(height: 16.0),
                  Text(
                    'Selected File: $_fileName',
                    style: DLSTextStyle.paragraphSmall
                        .copyWith(color: DLSColors.textSub500),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'File Size: ${_fileSize!.toStringAsFixed(2)} MB',
                    style: DLSTextStyle.paragraphSmall
                        .copyWith(color: DLSColors.textSub500),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
