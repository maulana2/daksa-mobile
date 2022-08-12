import 'package:daksa_mobile_apps/app/routes/app_pages.dart';
import 'package:get/get.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AccountController extends GetxController {
  logOut() async {
    final urlLogout = "https://mockva.daksa.co.id/mockva-rest/rest/auth/logout";
    const String apikey = "6aa6160d-2720-4080-8673-5dbbd482d4fe";
    const String secretKey =
        "2c68m66b9j97b2ffptvxebjy9vov5f8lhgk93g5jhgkqx4i58524o3j713cit3xz";
    // ignore: prefer_const_declarations
    final String credential = "$apikey:$secretKey";
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    var encode = stringToBase64.encode(credential);
    String basicAuth = 'Basic $encode';
    final pref = await SharedPreferences.getInstance();
    final String? sessionId = pref.getString("Session");

    var response = await http.delete(Uri.parse(urlLogout), headers: {
      "Authorization": basicAuth,
      "content-type": 'application/json',
      "_sessionId": sessionId.toString(),
    });
    if (response.statusCode == 204) {
      Get.offAndToNamed(Routes.LOGIN);
    }
  }
}
