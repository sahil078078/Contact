import 'package:contact/HelperFunctions/my_text_style.dart';
import 'package:contact/Screens/Components/leading_icon.dart';
import 'package:flutter/material.dart';
import '../Constants/color_const.dart';

class SelectGroup extends StatefulWidget
{
 final List<String> list;
  const SelectGroup({Key? key,required this.list}) : super(key: key);

  @override
  State<SelectGroup> createState() => _SelectGroupState();
}

class _SelectGroupState extends State<SelectGroup> {
  final List<String> original = [
    "Colleagues",
    "Family",
    "Friends",
  ];

  List<String> selected = [];

  @override
  void initState() {
    selected=widget.list;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Select Group"),
        leading: leadingIcon(context,result:selected ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 13,
        ),
        child: ListView.builder(
          itemCount: original.length,
          itemBuilder: (context, index) {
            return CheckboxListTile(

              dense: true,
              title: Text(
                original.elementAt(index),
                style: MyTextStyle.semiBold.copyWith(
                  color: ColorConst.appPrimary,
                ),
              ),
              value: selected.contains(
                original.elementAt(index),
              ),
              onChanged: (update) {
                setState(
                  () {
                    if (selected.contains(original.elementAt(index))) {
                      selected.remove(original.elementAt(index));
                    } else {
                      selected.add(original.elementAt(index));
                    }
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
