// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:html' as html;
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:file_picker/file_picker.dart';
import 'package:untukmu_flutter_design_system/src/components/button/circular_button_widget.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

class FileUploadAreaWebWidget extends StatefulWidget {
  final String title;
  final String subtitle;
  final String buttonText;
  final String fileTypes;
  final String maxSize;

  const FileUploadAreaWebWidget({
    super.key,
    this.title = 'Choose a file or drag & drop it here.',
    this.subtitle = 'JPEG, PNG, PDF, and MP4 formats, up to 50 MB.',
    this.buttonText = 'Browse File',
    this.fileTypes = 'JPEG, PNG, PDF, and MP4 formats',
    this.maxSize = '50 MB',
  });

  @override
  FileUploadAreaWebWidgetState createState() => FileUploadAreaWebWidgetState();
}

class FileUploadAreaWebWidgetState extends State<FileUploadAreaWebWidget> {
  html.File? droppedFile;
  String? _fileName;
  double? _fileSize;

  bool _isHovering = false;

  void _handleDragOver(html.MouseEvent event) {
    event.preventDefault();
    event.stopPropagation();
    setState(() {
      _isHovering = true;
    });
  }

  void _handleDragLeave(html.MouseEvent event) {
    event.preventDefault();
    event.stopPropagation();
    setState(() {
      _isHovering = false;
    });
  }

  void _handleDrop(html.MouseEvent event) {
    event.preventDefault();
    event.stopPropagation();

    final dataTransfer = event.dataTransfer;
    if (dataTransfer.files != null && dataTransfer.files!.isNotEmpty) {
      var file = dataTransfer.files!.first;
      setState(() {
        droppedFile = file;
        _fileName = file.name;
        _fileSize = file.size / (1024 * 1024); // Convert bytes to MB
        _isHovering = false;
      });
    }
  }

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;

      setState(() {
        droppedFile = html.File(file.bytes!, file.name);
        _fileName = file.name;
        _fileSize = file.size / (1024 * 1024); // Convert bytes to MB
      });
    }
  }

  @override
  void initState() {
    super.initState();
    html.document.body!.onDragOver.listen(_handleDragOver);
    html.document.body!.onDrop.listen(_handleDrop);
    html.document.body!.onDragLeave.listen(_handleDragLeave);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DottedBorder(
          borderType: BorderType.RRect,
          radius: const Radius.circular(12),
          color: DLSColors.strokeSub300,
          dashPattern: const [6],
          child: Container(
            decoration: BoxDecoration(
              color: _isHovering ? DLSColors.bgWeak100 : DLSColors.bgWhite0,
              borderRadius: DLSRadius.radius10,
            ),
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(Iconsax.document_upload,
                    color: DLSColors.textSub500, size: 24),
                const SizedBox(height: 16.0),
                Center(
                  child: Text(
                    widget.title,
                    style: DLSTextStyle.labelMedium
                        .copyWith(color: DLSColors.textMain900),
                  ),
                ),
                const SizedBox(height: 8.0),
                Center(
                  child: Text(
                    widget.subtitle,
                    style: DLSTextStyle.paragraphSmall
                        .copyWith(color: DLSColors.textSoft400),
                  ),
                ),
                const SizedBox(height: 16.0),
                Center(
                  child: CircularButtonWidget(
                    label: widget.buttonText,
                    pickFile: _pickFile,
                  ),
                ),
                if (_fileName != null && _fileSize != null) ...[
                  const SizedBox(height: 16.0),
                  Center(
                    child: Text(
                      'Selected File: $_fileName',
                      style: DLSTextStyle.paragraphSmall
                          .copyWith(color: DLSColors.textSub500),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Center(
                    child: Text(
                      'File Size: ${_fileSize!.toStringAsFixed(2)} MB',
                      style: DLSTextStyle.paragraphSmall
                          .copyWith(color: DLSColors.textSub500),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
