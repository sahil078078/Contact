import 'dart:io';

import 'package:image_picker/image_picker.dart';

Future<File?> gallery({ImageSource imageSource = ImageSource.gallery}) async {
  ImagePicker picker = ImagePicker();
  XFile? file = await picker.pickImage(
    source: imageSource,
  );

  if (file != null) {
    return File(file.path);
  } else {
    return null;
  }
}
