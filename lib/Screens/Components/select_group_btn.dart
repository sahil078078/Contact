import 'package:flutter/material.dart';
import '../../Constants/color_const.dart';
import '../../HelperFunctions/my_text_style.dart';

class SelectGroupBtn extends StatelessWidget {
  final void Function() onTap;
  const SelectGroupBtn({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Select Group",
              style: MyTextStyle.semiBold.copyWith(
                fontSize: 15,
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 15,
              color: ColorConst.grey,
            )
          ],
        ),
      ),
    );
  }
}