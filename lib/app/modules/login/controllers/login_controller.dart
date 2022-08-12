import 'dart:convert';

import 'package:daksa_mobile_apps/app/modules/login/models/loginModels.dart';
import 'package:daksa_mobile_apps/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final String urlLogin =
      "https://mockva.daksa.co.id/mockva-rest/rest/auth/login";

  TextEditingController usernameC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  Future<void> login() async {
    const String apikey = "6aa6160d-2720-4080-8673-5dbbd482d4fe";
    const String secretKey =
        "2c68m66b9j97b2ffptvxebjy9vov5f8lhgk93g5jhgkqx4i58524o3j713cit3xz";
    // ignore: prefer_const_declarations
    final String credential = "$apikey:$secretKey";
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    var encode = stringToBase64.encode(credential);
    String basicAuth = 'Basic $encode';
    final body = {
      "username": usernameC.text,
      "password": passwordC.text,
    };
    var response =
        await http.post(Uri.parse(urlLogin), body: jsonEncode(body), headers: {
      "Authorization": basicAuth,
      "content-type": 'application/json',
    });
    var user = LoginModels.fromJson(jsonDecode(response.body));

    if (usernameC.text.isNotEmpty && passwordC.text.isNotEmpty) {
      if (response.statusCode == 200) {
        final pref = await SharedPreferences.getInstance();
        await pref.setString("Session", "${user.id}");
        await pref.setString("Id", user.accountId.toString());
        Get.offAllNamed(Routes.HOME);
      } else if (response.body == "Account not found") {
        Get.snackbar("Terjadi Kesalahan", "User tidak ditemukan");
      } else if (response.body == "Invalid password") {
        Get.snackbar("Terjadi Kesalahan", "Password salah");
      } else {
        Get.snackbar("Terjadi Kesalahan", "Terjadi Kesalahan");
      }
      print(response.body);
    } else {
      Get.snackbar(
          "Terjadi Kesalahan", "Username dan Password tidak boleh kosong");
    }
  }
}
