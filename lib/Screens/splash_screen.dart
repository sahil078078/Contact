import 'package:contact/Constants/color_const.dart';
import 'package:contact/HelperFunctions/my_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'contact_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      navigation(context);
    });
    super.initState();
  }

  Future<void> navigation(BuildContext context) async {
    Future.delayed(
      const Duration(seconds: 2, milliseconds: 500),
      () {
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(
            builder: (context) => const ContactPage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/Images/contact.jpg',
            ),
            Text(
              "Contact Service",
              style: MyTextStyle.bold.copyWith(
                fontSize: 25,
                color: ColorConst.appPrimary,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Welcome To Our Service",
              style: MyTextStyle.medium.copyWith(
                fontSize: 20,
                color: ColorConst.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
