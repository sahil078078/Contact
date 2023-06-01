import 'dart:convert';
import 'package:flutter/material.dart';
import '../HelperFunctions/shered_pref.dart';

class ContactProvider extends ChangeNotifier {
  // final List<Map<String, dynamic>> contactList = [];

  // create new user
  // void createContact({required Map<String, dynamic> contact}) {
  //   debugPrint('ProviderClass : contact => $contact');
  //   contactList.add(contact);
  //   notifyListeners();
  // }

  // delete user
  // void deleteContact({required Map<String, dynamic> contact}) {
  //   contactList.remove(contact);
  //   notifyListeners();
  // }

  // updateContact
  // void updateContact({
  //   required int index,
  //   required Map<String, dynamic> contact,
  // }) {
  //   debugPrint('index : $index -> $contact');
  //   contactList[index] = contact;
  //   notifyListeners();
  // }

  // ===== with sheredPrefrences

  List<Map<String, dynamic>> get contactList => readFromList();

  List<Map<String, dynamic>> readFromList() {
    final original = sheredPref.contact;
    // string to json
    return List<Map<String, dynamic>>.from(
        original.map((e) => jsonDecode(e)).toList());
  }

  // createContact
  void createContact({required Map<String, dynamic> contact}) {
    debugPrint('CreateNew : $contact');
    final original = sheredPref.contact; // realList
    original.add(jsonEncode(contact));
    sheredPref.contact = original; // newList stored in SF.
    notifyListeners();
  }

  // deleteContact
  void deleteContact({required Map<String, dynamic> contact}) {
    final original = sheredPref.contact;
    original.remove(jsonEncode(contact));
    sheredPref.contact = original;
    notifyListeners();
  }

  // updateContact
  void updateContact({
    required int index,
    required Map<String, dynamic> contact,
  }) {
    final original = sheredPref.contact;
    original[index] = jsonEncode(contact);
    sheredPref.contact = original;
    notifyListeners();
  }
}
