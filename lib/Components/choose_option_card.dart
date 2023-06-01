import 'package:flutter/material.dart';
import '../Constants/color_const.dart';
import '../HelperFunctions/my_text_style.dart';

class ChooseOptionCard extends StatelessWidget {
  final String assetPath;
  final String title;
  final void Function() onTap;

  const ChooseOptionCard({
    Key? key,
    required this.assetPath,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: ColorConst.appbarColor.withOpacity(0.1),
      child: Row(
        children: [
          SizedBox(
            width: 40,
            height: 40,
            child: Image.asset(
              assetPath,
            ),
          ),
          const SizedBox(width: 15),
          Text(
            title,
            style: MyTextStyle.medium.copyWith(
              color: ColorConst.appPrimary,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
