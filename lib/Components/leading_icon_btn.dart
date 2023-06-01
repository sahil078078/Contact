import 'package:flutter/material.dart';
class LeadingIconBtn extends StatelessWidget {
  const LeadingIconBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if(Navigator.canPop(context))
        {
          Navigator.pop(context);
        }
      },
      icon: const Icon(
        Icons.arrow_back_ios,
        size: 20,
      ),
    );
  }
}