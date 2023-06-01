import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> whatsappLaunch(String number) async {
  final link = "https://wa.me/91$number";
  final Uri url = Uri.parse(link);

  bool willLaunch = await canLaunchUrl(url);
  try {
    if (willLaunch) {
      launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
    } else {
      Fluttertoast.showToast(msg: "Can't launch in whatsapp");
    }
  } catch (e) {
    Fluttertoast.showToast(msg: "Something went wrong");
  }
}

Future<void> callerLauncher(String number) async {
  final Uri uri = Uri(
    scheme: "tel",
    path: number,
  );

  try {
    bool willLaunch = await canLaunchUrl(uri);
    if (willLaunch) {
      launchUrl(
        uri,
      );
    } else {
      Fluttertoast.showToast(msg: "Can't call");
    }
  } catch (e) {
    Fluttertoast.showToast(msg: "Something Went Wrong");
  }
}

Future<void> smsLauncher(String number) async {
  final Uri uri = Uri(
    scheme: "sms",
    path: number,
    queryParameters: <String, dynamic>{
      'body': Uri.encodeComponent('This app is made by creative student'),
    },
  );

  try {
    bool willLaunch = await canLaunchUrl(uri);
    if (willLaunch) {
      launchUrl(uri);
    } else {
      Fluttertoast.showToast(msg: "Can't send sms");
    }
  } catch (e) {
    Fluttertoast.showToast(msg: "Something Went Wrong");
  }
}

Future<void> emailLauncher(String email) async {
  final Uri uri = Uri(
    scheme: "mailto",
    path: email,
  );

  try {
    bool willLaunch = await canLaunchUrl(uri);

    if (willLaunch) {
      launchUrl(uri);
    } else {
      Fluttertoast.showToast(msg: "Can't send email");
    }
  } catch (e) {
    Fluttertoast.showToast(msg: "Something Went Wrong");
  }
}
