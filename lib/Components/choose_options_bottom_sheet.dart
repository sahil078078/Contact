// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../Constants/color_const.dart';
import '../HelperFunctions/choose_photo.dart';
import '../HelperFunctions/my_text_style.dart';
import 'choose_option_card.dart';

class ChooseOptionsBottomSheet extends StatelessWidget {
  const ChooseOptionsBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Choose Option",
            style: MyTextStyle.semiBold.copyWith(
              color: ColorConst.grey,
              fontSize: 20,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 25),
            child: Divider(
              color: ColorConst.appPrimary,
              thickness: 1,
              height: 0.0,
            ),
          ),


          ChooseOptionCard(
            assetPath: "assets/Images/gallery.jpg",
            title: "Gallery",
            onTap: () async{
              File? file =   await gallery();
              Navigator.pop(context,file);
            },
          ),
          const SizedBox(height: 10),
          ChooseOptionCard(
            assetPath: "assets/Images/camera.jpg",
            title: "Camera",
            onTap: () async{
              File? file =   await   gallery(
                imageSource: ImageSource.camera,
              );
              Navigator.pop(context,file);
            },
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}