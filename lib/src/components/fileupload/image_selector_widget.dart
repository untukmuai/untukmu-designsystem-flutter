import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'dart:io';

import 'package:untukmu_flutter_design_system/untukmu_flutter_design_system.dart';

class ImageSelectorWidget extends StatefulWidget {
  final bool isLarge;
  final bool isDisabled;
  final Function(File)? onImageSelected;

  const ImageSelectorWidget(
      {super.key,
      this.isLarge = true,
      this.isDisabled = false,
      this.onImageSelected});

  @override
  ImageSelectorWidgetState createState() => ImageSelectorWidgetState();
}

class ImageSelectorWidgetState extends State<ImageSelectorWidget> {
  File? _imageFile;

  Future<void> _pickImage() async {
    if (widget.isDisabled) return;
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      setState(() {
        if (widget.onImageSelected != null) {
          widget.onImageSelected!(File(result.files.single.path!));
        }
        _imageFile = File(result.files.single.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double size = widget.isLarge ? 100.0 : 50.0;
    Widget content;

    if (_imageFile == null) {
      content = DottedBorder(
        color:
            widget.isDisabled ? DLSColors.strokeSub300 : DLSColors.primaryBase,
        borderType: BorderType.RRect,
        radius: const Radius.circular(12),
        dashPattern: const [6],
        child: SizedBox(
          width: size,
          height: size,
          child: Center(
            child: Icon(IconsaxPlusLinear.gallery_add,
                color: widget.isDisabled
                    ? DLSColors.strokeSub300
                    : DLSColors.primaryBase,
                size: widget.isLarge ? 20 : 20),
          ),
        ),
      );
    } else {
      content = Container(
        width: size,
        height: size,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          border: Border.all(color: DLSColors.strokeSoft200, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.file(_imageFile!),
        ),
      );
    }

    return GestureDetector(
      onTap: _pickImage,
      child: content,
    );
  }
}
