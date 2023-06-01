import 'package:contact/Constants/color_const.dart';
import 'package:contact/HelperFunctions/my_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NoContactPage extends StatelessWidget {
  const NoContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 200,
            height: 250,
            child: SvgPicture.asset(
              "assets/icons/contacts.svg",
            ),
          ),
          Text(
            "Your Contact list is empty",
            style: MyTextStyle.semiBold.copyWith(
              color: ColorConst.grey,
              fontSize: 17,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "Enter user contact number",
            style: MyTextStyle.medium.copyWith(
              color: ColorConst.black,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
