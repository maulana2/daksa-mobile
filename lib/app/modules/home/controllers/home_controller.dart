import 'dart:convert';

import 'package:daksa_mobile_apps/app/modules/home/models/detail_account.dart';
import 'package:daksa_mobile_apps/app/modules/login/controllers/login_controller.dart';
import 'package:daksa_mobile_apps/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  final url = "https://mockva.daksa.co.id/mockva-rest/rest/account/detail";
  var detailA = <DetailAccount>[];

  @override
  onInit() {
    super.onInit();
    getDetail();
  }

  Future getDetail() async {
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
    final String? id = pref.getString("Id");

    var response = await http.get(
        Uri.parse(url).replace(queryParameters: {"id": id.toString()}),
        headers: {
          "Authorization": basicAuth,
          "content-type": 'application/json',
          "_sessionId": sessionId.toString(),
        });
    var detail = DetailAccount.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);

    return detailA.add((DetailAccount(
        id: detail.id,
        name: detail.name,
        balance: detail.balance,
        username: detail.username)));
  }
}
