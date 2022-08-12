import 'package:daksa_mobile_apps/app/modules/transfer/models/transfer_inquiry.dart';
import 'package:daksa_mobile_apps/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class TransferController extends GetxController {
  final urlTransIq =
      "https://mockva.daksa.co.id/mockva-rest/rest/account/transaction/transferInquiry";
  TextEditingController accountDController = TextEditingController();
  TextEditingController amountC = TextEditingController();
  transferIq() async {
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
    final body = {
      "accountSrcId": id,
      "accountDstId": accountDController.text,
      "amount": amountC.text,
    };

    if (accountDController.text.isNotEmpty && amountC.text.isNotEmpty) {
      var response = await http.post(Uri.parse(urlTransIq),
          headers: {
            "Authorization": basicAuth,
            "Content-Type": "application/json",
            "_sessionId": sessionId.toString(),
          },
          body: jsonEncode(body));
      var transferInquiry = await TransferInquiry.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
   
      try {
        if (response.statusCode == 200) {
          Get.toNamed(Routes.TRANSFER_CONFIRM, arguments: [
            {
              "inquiryId": transferInquiry.inquiryId,
            },
            {
              "accountSrcId": transferInquiry.accountSrcId,
            },
            {
              "accountSrcName": transferInquiry.accountSrcName,
            },
            {
              "accountDstId": transferInquiry.accountDstId,
            },
            {"accountDstName": transferInquiry.accountDstName},
            {"amount": transferInquiry.amount},
          ]);
        }
      } catch (e) {
        if (e == "Account not found") {
          Get.snackbar("Terjadi Kesalahan", "Account ID Tidak Ditemukan");
        }
        print(e);
      }
    } else {
      Get.snackbar(
          "Terjadi kesalahan", "Account Destination dan Amount harus di isi");
    }
  }
}
