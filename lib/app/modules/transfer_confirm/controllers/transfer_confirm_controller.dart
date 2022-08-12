import 'package:daksa_mobile_apps/app/modules/transfer_confirm/models/transfer_confirm.dart';
import 'package:daksa_mobile_apps/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class TransferConfirmController extends GetxController {
  var urlTransConfirm =
      "https://mockva.daksa.co.id/mockva-rest/rest/account/transaction/transfer";
  var data = Get.arguments;
  confirm() async {
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

    final body = {
      "inquiryId": data[0]['inquiryId'],
      "accountSrcId": data[1]['accountSrcId'],
      "accountDstId": data[3]['accountDstId'],
      "amount": data[5]['amount'],
    };
    final headers = {
      "Authorization": basicAuth,
      "Content-Type": "application/json",
      "_sessionId": sessionId.toString(),
    };
    var response = await http.post(
        Uri.parse(
            "https://mockva.daksa.co.id/mockva-rest/rest/account/transaction/transfer"),
        body: jsonEncode(body),
        headers: headers);
    var result = TransferConfirmModels.fromJson(jsonDecode(response.body));
    
    try {
      if (response.statusCode == 200) {
        Get.offAllNamed(Routes.TRANSFER_SUCCES, arguments: [
          {
            "accountSrcId": data[1]['accountSrcId'],
          },
          {
            "accountSrcName": data[2]['accountSrcName'],
          },
          {
            "accountDstId": result.accountDstId,
          },
          {"accountDstName": data[4]['accountDstName']},
          {"amount": result.amount},
          {"refrenceNum": result.clientRef},
          {"timeStamp": result.transactionTimestamp},
        ]);
      }
      else {
        Get.snackbar("Terjadi Kesalahan", "Kesalahan ${response.body}");
        Get.offAllNamed(Routes.HOME);
        print(response.body);
      }
    } catch (e) {
      Get.snackbar("Terjadi Kesalahan", "Kesalahan ${response.body}");
      print(response.body);
    }
  }
}
