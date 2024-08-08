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
  final bool hideTitle;
  final bool hideSubtitle;
  final Widget? unsentIcon;
  final Function(File)? onImageChanged;

  const ImageUploadWidget(
      {super.key,
      this.title = 'Upload Image',
      this.unsentIcon,
      this.subtitle = 'Min 400x400px, PNG or JPEG',
      this.uploadButtonText = 'Upload',
      this.removeButtonText = 'Remove',
      this.changePhotoButtonText = 'Change Photo',
      this.hideSubtitle = false,
      this.hideTitle = false,
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
        Container(
          child: _imagePath == null
              ? (widget.unsentIcon ??
                  Image.asset(
                    "packages/untukmu_flutter_design_system/assets/images/ic_avatar.png",
                    width: 64,
                    height: 64,
                    fit: BoxFit.cover,
                  ))
              : ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.file(
                    File(_imagePath!),
                    width: 64,
                    height: 64,
                    fit: BoxFit.cover,
                  ),
                ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!widget.hideTitle)
              Container(
                margin: const EdgeInsets.only(bottom: 4),
                child: Text(
                  widget.title,
                  style: DLSTextStyle.labelLarge
                      .copyWith(color: DLSColors.textMain900),
                ),
              ),
            if (!widget.hideSubtitle)
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: Text(
                  widget.subtitle,
                  style: DLSTextStyle.labelMedium
                      .copyWith(color: DLSColors.textSoft400),
                ),
              ),
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
