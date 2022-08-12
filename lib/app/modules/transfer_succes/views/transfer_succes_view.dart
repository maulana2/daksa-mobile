import 'package:daksa_mobile_apps/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/transfer_succes_controller.dart';

class TransferSuccesView extends GetView<TransferSuccesController> {
  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff54BAB9),
        title: Text('Transfer Succes'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 35, left: 20, right: 20),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Account Source ID",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                data[0]['accountSrcId'].toString(),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Account Source Name",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                data[1]['accountSrcName'].toString(),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Account Destination ID",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                data[2]['accountDstId'].toString(),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Account Destination Name",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                data[3]['accountDstName'].toString(),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Amount",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                data[4]['amount'].toString(),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Reference Number",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                data[5]['refrenceNum'].toString(),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Transaction Timestamp",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                data[6]['timeStamp'].toString(),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Status",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                "SUCCESS",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color(0xff54BAB9),
            ),
              onPressed: () {
                Get.offAndToNamed(Routes.HOME);
              },
              child: Text("OK"))
        ],
      ),
    );
  }
}
