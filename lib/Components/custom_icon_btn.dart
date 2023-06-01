import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../Constants/color_const.dart';

class CustomIconBtn extends StatelessWidget {
  final double size;
  final String svgPath;
  final void Function() onTap;
  final Color? iconColor, background;
  final ColorFilter? colorFilter;
  const CustomIconBtn({
    Key? key,
    required this.svgPath,
    required this.onTap,
    this.size = 30,
    this.iconColor,
    this.background,
    this.colorFilter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(5.0),
      child: Container(
        width: size,
        height: size,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: background ?? Colors.black.withOpacity(0.1),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: SvgPicture.asset(
          svgPath,
          colorFilter: colorFilter ??
              ColorFilter.mode(
                iconColor ?? ColorConst.black,
                BlendMode.srcIn,
              ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
