import 'package:contact/HelperFunctions/shered_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'Constants/color_const.dart';
import 'Providers/contact_provider.dart';
import 'Screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sheredPref.initPref();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ContactProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contact',
      theme: ThemeData(
        fontFamily: "Nunito",
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
          backgroundColor: ColorConst.appPrimary,
          centerTitle: true,
          elevation: 0.0,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: "Nunito",
            fontSize: 20.5,
          ),
        ),
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.all(ColorConst.appPrimary),
          // checkColor: MaterialStateProperty.all(Colors.pink),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          materialTapTargetSize: MaterialTapTargetSize.padded,
        ),
      ),
      // home: const ContactPage(),
      home: const SplashScreen(),
    );
  }
}





/* 
CRUD
C -> create
R -> Read
U -> Update
D -> Delete
*/
