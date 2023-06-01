import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  SharedPreferences? pref;
  Future<void> initPref() async {
    // pref = pref != null ? pref : await SharedPreferences.getInstance();
    pref = pref ?? await SharedPreferences.getInstance();
  }

  // set a list (insert)
  set contact(List<String> value) => pref?.setStringList("contact", value);

  //  list receive
  List<String> get contact => pref?.getStringList("contact") ?? [];
}

final sheredPref = SharedPref();
