import 'dart:io';

import 'package:app/core/constants/assets.dart';
import 'package:app/core/constants/sizes.dart';
import 'package:app/core/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class ProfileImagePicker extends StatefulWidget {
  const ProfileImagePicker({
    required this.onPickImage,
    super.key,
  });
  final void Function(File image) onPickImage;

  @override
  State<ProfileImagePicker> createState() => _ProfileImagePickerState();
}

class _ProfileImagePickerState extends State<ProfileImagePicker> {
  File? _selectedImage;

  Future<void> _takePicture(bool isFromGallery) async {
    final picker = ImagePicker();
    try {
      final XFile? image = await picker.pickImage(
        source: isFromGallery ? ImageSource.gallery : ImageSource.camera,
      );
      if (image == null) return;

      final File? croppedImage = await _cropImage(File(image.path));
      if (croppedImage != null) {
        setState(() => _selectedImage = croppedImage);
        widget.onPickImage(_selectedImage!);
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
    }
  }

  Future<File?> _cropImage(File imageFile) async {
    final CroppedFile? croppedFile = await ImageCropper().cropImage(
      maxHeight: (context.height * .5).toInt(),
      maxWidth: (context.width * .5).toInt(),

      sourcePath: imageFile.path,

      // aspectRatioPresets: [
      //   CropAspectRatioPreset.square,
      // ],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'قص الصورة',
          toolbarColor: context.colorScheme.primary,
          toolbarWidgetColor: context.colorScheme.onPrimary,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          title: 'قص الصورة',
          cancelButtonTitle: 'إلغاء',
        ),
      ],
    );

    return croppedFile != null ? File(croppedFile.path) : null;
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Container(
      decoration: BoxDecoration(
        color: Theme.of(context).hoverColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: SvgPicture.asset(
          Assets.assetsSvgCamera,
          height: 100,
          color: Theme.of(context).hintColor.withAlpha(100),
        ),
      ),
    );

    if (_selectedImage != null) {
      content = ClipOval(
        child: Image.file(
          _selectedImage!,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      );
    }

    return Column(
      children: [
        Container(
          height: 170,
          width: 170,
          padding: EdgeInsets.all(Insets.small / 1.5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.colorScheme.primary,
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            padding: EdgeInsets.all(Insets.small),
            child: content,
          ),
        ),
        SizedBox(height: Insets.medium),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: () async => await _takePicture(false),
              style: IconButton.styleFrom(
                backgroundColor: context.colorScheme.primary,
                shadowColor: context.colorScheme.primary,
                foregroundColor: context.colorScheme.primary,
              ),
              child: Padding(
                padding: EdgeInsets.all(Insets.extraSmall / 2),
                child: SvgPicture.asset(
                  Assets.assetsSvgCamera,
                  color: context.colorScheme.onPrimary,
                ),
              ),
            ),
            SizedBox(width: Insets.small),
            OutlinedButton(
              onPressed: () async => await _takePicture(true),
              child: Text(
                'أختر من المعرض',
                style: TextStyle(
                  fontSize: Insets.medium,
                  color: Theme.of(context).hintColor.withAlpha(100),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
