import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:untukmu_flutter_design_system/src/components/button/circular_button.dart';
import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';
import 'dart:io';

class ImageUploadWidget extends StatefulWidget {
  final String title;
  final String subtitle;
  final String uploadButtonText;
  final String removeButtonText;
  final String changePhotoButtonText;
  final Function(File)? onImageChanged;

  const ImageUploadWidget(
      {super.key,
      this.title = 'Upload Image',
      this.subtitle = 'Min 400x400px, PNG or JPEG',
      this.uploadButtonText = 'Upload',
      this.removeButtonText = 'Remove',
      this.changePhotoButtonText = 'Change Photo',
      this.onImageChanged});

  @override
  ImageUploadWidgetState createState() => ImageUploadWidgetState();
}

class ImageUploadWidgetState extends State<ImageUploadWidget> {
  String? _imagePath;

  void _pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      setState(() {
        _imagePath = result.files.first.path;
        if (widget.onImageChanged != null) {
          widget.onImageChanged!(File(_imagePath!));
        }
      });
    }
  }

  void _removeImage() {
    setState(() {
      _imagePath = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage:
              _imagePath != null ? FileImage(File(_imagePath!)) : null,
          child: _imagePath == null
              ? const Icon(
                  Icons.account_circle,
                  size: 80,
                  color: DLSColors.textSoft400,
                )
              : null,
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: DLSTextStyle.labelLarge
                  .copyWith(color: DLSColors.textMain900),
            ),
            const SizedBox(height: 4),
            Text(
              widget.subtitle,
              style: DLSTextStyle.labelMedium
                  .copyWith(color: DLSColors.textSoft400),
            ),
            const SizedBox(height: 16),
            if (_imagePath == null)
              CircularButtonWidget(
                label: widget.uploadButtonText,
                pickFile: _pickImage,
              )
            else
              Row(
                children: [
                  CircularButtonWidget(
                    label: widget.removeButtonText,
                    pickFile: _removeImage,
                    color: DLSColors.errorBase,
                  ),
                  const SizedBox(width: 12),
                  CircularButtonWidget(
                    label: widget.changePhotoButtonText,
                    pickFile: _pickImage,
                  ),
                ],
              ),
          ],
        ),
      ],
    );
  }
}
