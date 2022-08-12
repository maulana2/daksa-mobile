import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/transfer_controller.dart';

class TransferView extends GetView<TransferController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff54BAB9),
        title: Text('Transfer'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Text(
            "Account Destination",
            style: TextStyle(fontSize: 17),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            keyboardType: TextInputType.number,
            controller: controller.accountDController,
            autocorrect: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              hintText: "Enter account number",
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Amount",
            style: TextStyle(fontSize: 17),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            keyboardType: TextInputType.number,
            controller: controller.amountC,
            autocorrect: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              hintText: "Enter amount",
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xff54BAB9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                controller.transferIq();
              },
              child: Text("Transfer"))
        ],
      ),
    );
  }
}
