import 'package:contact/Constants/color_const.dart';
import 'package:contact/HelperFunctions/my_text_style.dart';
import 'package:contact/Providers/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfirmationPopup extends StatelessWidget {
  final Map<String, dynamic> contact;
  const ConfirmationPopup({
    super.key,
    required this.contact,
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.read<ContactProvider>();
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      contentPadding: EdgeInsets.zero,
      content: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 8,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.warning_amber_rounded,
              color: Colors.red,
              size: 55,
            ),
            Text(
              "Are you sure you want to delete this contact?",
              style: MyTextStyle.medium.copyWith(
                fontSize: 15,
                color: ColorConst.grey,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: const BorderSide(
                          color: ColorConst.grey400,
                          width: 0.75,
                        ),
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      "Cancel",
                      style: MyTextStyle.semiBold.copyWith(
                        fontSize: 15,
                        color: ColorConst.appPrimary,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorConst.appPrimary,
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: const BorderSide(
                          color: ColorConst.grey400,
                          width: 0.75,
                        ),
                      ),
                    ),
                    onPressed: () {
                      provider.deleteContact(contact: contact);
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Delete",
                      style: MyTextStyle.bold.copyWith(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
