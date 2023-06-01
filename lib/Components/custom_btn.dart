import 'package:flutter/material.dart';
import '../Constants/color_const.dart';
import '../HelperFunctions/my_text_style.dart';

class CustomBtn extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  final TextStyle? textStyle;

  const CustomBtn({
    Key? key,
    this.title = "Save",
    required this.onPressed,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0.0,
        backgroundColor: ColorConst.appPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: textStyle ?? MyTextStyle.medium.copyWith(
          fontSize: 15,
          color: Colors.white,
        ),
      ),
    );
  }
}