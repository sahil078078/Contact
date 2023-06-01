import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import '../Constants/color_const.dart';

Future<File?> myImageCropper({
  required File file,
  required BuildContext context,
}) async {
  CroppedFile? croppedFile = await ImageCropper().cropImage(
    sourcePath: file.path,
    compressQuality: 100,
    aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
    // -> fixed ratio
    aspectRatioPresets: [
      CropAspectRatioPreset.square,
      // CropAspectRatioPreset.ratio3x2,
      // CropAspectRatioPreset.ratio4x3,
      // CropAspectRatioPreset.ratio5x3,
      // CropAspectRatioPreset.ratio7x5,
      // CropAspectRatioPreset.ratio16x9,
      // CropAspectRatioPreset.original,
    ],

    uiSettings: [
      AndroidUiSettings(
        backgroundColor: Colors.grey,
        cropGridColor: Colors.transparent,
        cropFrameColor: Colors.grey,
        showCropGrid: true,
        activeControlsWidgetColor: Colors.white,
        lockAspectRatio: true,
        toolbarColor: ColorConst.appPrimary,
        toolbarTitle: "Crop Image",
        statusBarColor: ColorConst.appPrimary,
        hideBottomControls: true,
        toolbarWidgetColor: Colors.white,
        initAspectRatio: CropAspectRatioPreset.square,
      ),
      IOSUiSettings(),
      WebUiSettings(context: context),
    ],
  );


  if(croppedFile!=null) return File(croppedFile.path);
  return null;
}
