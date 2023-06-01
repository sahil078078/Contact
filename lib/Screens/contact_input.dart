// ignore_for_file: use_build_context_synchronously
import 'dart:io';
import 'package:contact/Components/my_text_form_field.dart';
import 'package:contact/HelperFunctions/date_format.dart';
import 'package:contact/HelperFunctions/get_date.dart';
import 'package:contact/HelperFunctions/my_image_crop.dart';
import 'package:contact/Providers/contact_provider.dart';
import 'package:contact/Screens/select_group.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../Components/choose_options_bottom_sheet.dart';
import '../Components/custom_btn.dart';
import '../Components/leading_icon_btn.dart';
import 'Components/select_group_btn.dart';

class ContactInput extends StatefulWidget {
  final Map<String, dynamic>? contact;
  final int? index;
  const ContactInput({
    Key? key,
    this.contact,
    this.index,
  }) : super(key: key);

  @override
  State<ContactInput> createState() => _ContactInputState();
}

class _ContactInputState extends State<ContactInput> {
  List<String> mySelectedGroup = [];
  File? imageFile;
  DateTime? birthDate;

  // controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();

  // key
  final formKey = GlobalKey<FormState>();

  // inistate

  @override
  void initState() {
    debugPrint('contact -> ${widget.contact}');
    if (widget.contact != null) {
      nameController.text = widget.contact!['name'];
      mobileController.text = widget.contact!['mobile'];
      emailController.text = widget.contact!['email'];

      mySelectedGroup = List<String>.from(widget.contact!['group']);
      imageFile = widget.contact?["profile"] != null
          ? File(widget.contact!["profile"])
          : null;
      birthDate = DateTime.tryParse(widget.contact!['dob']);

      if (widget.contact?["dob"] != null && widget.contact!["dob"].isNotEmpty) {
        birthDateController.text = dateFormate(
          DateTime.parse(
            widget.contact!['dob'],
          ),
        );
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.read<ContactProvider>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const LeadingIconBtn(),
        title: Text(widget.contact != null ? "Update Contact" : "Save Contact"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 13,
          ),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                InkWell(
                  onTap: () async {
                    File? file = await showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      context: context,
                      builder: (context) {
                        return const ChooseOptionsBottomSheet();
                      },
                    );
                    if (file != null) {
                      File? croppedFile = await myImageCropper(
                        file: file,
                        context: context,
                      );

                      if (croppedFile != null) {
                        setState(() {
                          imageFile = croppedFile;
                        });
                      }
                    }
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80),
                      color: Colors.black.withOpacity(0.2),
                    ),
                    child: ClipOval(
                      child: imageFile != null
                          ? Image.file(
                              imageFile!,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              "assets/Images/placeholder.jpg",
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                ),
                MyTextFormField(
                  controller: nameController,
                  label: "Name",
                  hintText: "Enter your name",
                  validator: (name) {
                    if (name == null || name.trim().isEmpty) {
                      return "Please enter name";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 20),
                MyTextFormField(
                  controller: mobileController,
                  label: "Mobile Number",
                  hintText: "Enter your mobile number",
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                  ],
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  validator: (phone) {
                    if (phone == null || phone.trim().isEmpty) {
                      return "Please enter phone number";
                    } else {
                      if (phone.trim().length != 10) {
                        return "Invalid number";
                      } else {
                        return null;
                      }
                    }
                  },
                ),
                const SizedBox(height: 20),
                MyTextFormField(
                  controller: emailController,
                  label: "Email",
                  hintText: "Enter your email",
                  validator: (email) {
                    if (email == null || email.trim().isEmpty) {
                      return null;
                    } else {
                      Pattern pattern =
                          r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";
                      RegExp regexp = RegExp(pattern.toString());
                      if (regexp.hasMatch(email.trim())) {
                        return null;
                      } else {
                        return "Please enter valid email";
                      }
                    }
                  },
                ),
                SelectGroupBtn(
                  onTap: () async {
                    final selected = await Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) {
                          return SelectGroup(list: mySelectedGroup);
                        },
                      ),
                    );
                    mySelectedGroup = selected;
                    setState(() {});
                  },
                ),
                MyTextFormField(
                  controller: birthDateController,
                  absorbing: true,
                  label: "Date Of Birth",
                  hintText: "Select date",
                  onTap: () async {
                    DateTime? date = await getDate(
                      context: context,
                      initialDate: birthDate,
                    );
                    if (date != null) {
                      setState(() {
                        birthDate = date;
                      });
                      birthDateController.text = dateFormate(birthDate!);
                    }
                    FocusManager.instance.primaryFocus!.unfocus();
                  },
                ),
                const SizedBox(height: 25),
                Align(
                  alignment: Alignment.bottomRight,
                  child: CustomBtn(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Map<String, dynamic> userInfo = {
                          'name': nameController.text.trim(),
                          'mobile': mobileController.text.trim(),
                          'email': emailController.text.trim(),
                          'dob': birthDate != null
                              ? birthDate!.toIso8601String()
                              : "",
                          'group': mySelectedGroup,
                          'profile': imageFile != null ? imageFile!.path : null,
                        };

                        // contact == null -> Save -> Create
                        // contact != null -> Update

                        // update
                        if (widget.contact != null) {
                          provider.updateContact(
                            index: widget.index!,
                            contact: userInfo,
                          );
                        }
                        //  create/Save
                        else {
                          provider.createContact(contact: userInfo);
                        }

                        Navigator.pop(context);
                      }
                    },
                    title: widget.contact != null ? "Update" : "Save",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
