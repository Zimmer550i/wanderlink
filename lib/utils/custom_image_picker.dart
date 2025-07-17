import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

Future<File?> customImagePicker({isCircular = true, isSquared = true}) async {
  final picker = ImagePicker();
  final cropper = ImageCropper();

  final XFile? pickedImage = await picker.pickImage(
    source: ImageSource.gallery,
  );

  if (pickedImage != null) {
    final CroppedFile? croppedImage = await cropper.cropImage(
      sourcePath: pickedImage.path,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop your image',
          toolbarColor: Color(0xff1C73A3),
          toolbarWidgetColor: Colors.blue[50],
          backgroundColor: Colors.black,
          statusBarColor: Colors.black,
          cropStyle: isCircular ? CropStyle.circle : CropStyle.rectangle,
          hideBottomControls: isSquared,
          initAspectRatio: CropAspectRatioPreset.square,
        ),
        IOSUiSettings(
          cropStyle: isCircular ? CropStyle.circle : CropStyle.rectangle,
          showCancelConfirmationDialog: true,
        ),
      ],
    );

    if (croppedImage != null) {
      return File(croppedImage.path);
    }
  }

  return null;
}
