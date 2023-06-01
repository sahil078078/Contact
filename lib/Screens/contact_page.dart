
import 'dart:io';
import 'package:contact/HelperFunctions/launcher_functions.dart';
import 'package:contact/HelperFunctions/my_text_style.dart';
import 'package:contact/HelperFunctions/shered_pref.dart';
import 'package:contact/Providers/contact_provider.dart';
import 'package:contact/Screens/contact_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Components/custom_icon_btn.dart';
import '../Constants/color_const.dart';
import 'Components/confirmation_popup.dart';
import 'Components/user_details.dart';
import 'no_contact_page.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ContactProvider>();
    final contactList = provider.contactList;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
      ),
      floatingActionButton: InkWell(
        onTap: () async {
          await Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => const ContactInput(),
            ),
          );

          debugPrint('===> ${sheredPref.contact}');
        },
        borderRadius: BorderRadius.circular(60),
        child: Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: ColorConst.appPrimary,
          ),
          child: const Icon(
            Icons.add_call,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 13,
        ),
        child: contactList.isEmpty
            ? const NoContactPage()
            : ListView.builder(
                padding: const EdgeInsets.only(bottom: 55),
                itemCount: contactList.length,
                itemBuilder: (context, index) {
                  final Map<String, dynamic> contact =
                      contactList.elementAt(index);
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => UserDetails(
                              contact: contact,
                            ),
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(5.0),
                      splashColor: ColorConst.appPrimary.withOpacity(0.1),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                            color: ColorConst.grey400,
                            width: 0.45,
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 10,
                                  top: 8,
                                  bottom: 8,
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: contact["profile"] != null
                                          ? Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                  color: ColorConst.appPrimary,
                                                  width: 0.75,
                                                ),
                                              ),
                                              child: ClipOval(
                                                child: Image.file(
                                                  File(contact["profile"]),
                                                ),
                                              ),
                                            )
                                          : Container(
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.black
                                                    .withOpacity(0.35),
                                                border: Border.all(
                                                  width: 0.35,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  contact['name']
                                                      .substring(0, 1)
                                                      .toString()
                                                      .toUpperCase(),
                                                  style:
                                                      MyTextStyle.bold.copyWith(
                                                    color: ColorConst.black,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ),
                                            ),
                                    ),
                                    const SizedBox(width: 15),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          contact['name'],
                                          style: MyTextStyle.semiBold.copyWith(
                                            color: ColorConst.black,
                                            fontSize: 16,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          contact['mobile'],
                                          style: MyTextStyle.regular.copyWith(
                                            color: ColorConst.grey,
                                            fontSize: 13.5,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    CustomIconBtn(
                                      svgPath: "assets/icons/sms.svg",
                                      iconColor: Colors.purple,
                                      background:
                                          Colors.purple.withOpacity(0.1),
                                      onTap: () async {
                                        smsLauncher(contact['mobile']);
                                      },
                                    ),
                                    const SizedBox(width: 15),
                                    CustomIconBtn(
                                      svgPath: "assets/icons/phone.svg",
                                      iconColor: Colors.blueAccent,
                                      background:
                                          Colors.blueAccent.withOpacity(0.1),
                                      onTap: () {
                                        callerLauncher(contact['mobile']);
                                      },
                                    ),
                                    const SizedBox(width: 5),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: PopupMenuButton(
                                offset: const Offset(6, 30),
                                elevation: 3.0,
                                tooltip: "Update-Delete",
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: const Icon(
                                  Icons.more_vert,
                                  size: 25,
                                  color: ColorConst.grey400,
                                ),
                                itemBuilder: (context) {
                                  return [
                                    PopupMenuItem(
                                      onTap: () {
                                        Future.delayed(
                                          Duration.zero,
                                          () async {
                                            await Navigator.push(
                                              context,
                                              CupertinoPageRoute(
                                                builder: (context) =>
                                                    ContactInput(
                                                  contact: contact,
                                                  index: index,
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      value: "Update",
                                      child: Row(
                                        children: [
                                          Text(
                                            "Update",
                                            style: MyTextStyle.medium.copyWith(
                                                fontSize: 15,
                                                color: ColorConst.appPrimary),
                                          ),
                                          const SizedBox(width: 10),
                                          const Icon(
                                            Icons.mode_edit,
                                            size: 17,
                                            color: ColorConst.appPrimary,
                                          )
                                        ],
                                      ),
                                    ),
                                    PopupMenuItem(
                                      onTap: () {
                                        Future.delayed(
                                          const Duration(seconds: 0),
                                          () {
                                            showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  ConfirmationPopup(
                                                      contact: contact),
                                            );
                                          },
                                        );
                                      },
                                      value: "Delete",
                                      child: Row(
                                        children: [
                                          Text(
                                            "Delete",
                                            style: MyTextStyle.medium.copyWith(
                                              fontSize: 15,
                                              color: Colors.red,
                                            ),
                                          ),
                                          const SizedBox(width: 13),
                                          const Icon(
                                            Icons.delete,
                                            size: 17,
                                            color: Colors.red,
                                          )
                                        ],
                                      ),
                                    )
                                  ];
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
