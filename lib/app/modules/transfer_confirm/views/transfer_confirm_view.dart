import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/transfer_confirm_controller.dart';

class TransferConfirmView extends GetView<TransferConfirmController> {
  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff54BAB9),
        title: Text('Transfer Confirm'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Column(
            children: [
              Text(
                "Account Source",
                style: TextStyle(fontSize: 17),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                keyboardType: TextInputType.number,
                readOnly: true,
                autocorrect: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: data[1]['accountSrcId'],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Account Source Name",
                style: TextStyle(fontSize: 17),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                keyboardType: TextInputType.number,
                autocorrect: false,
                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: data[2]['accountSrcName'],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Account Destination",
                style: TextStyle(fontSize: 17),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                keyboardType: TextInputType.number,
                autocorrect: false,
                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: data[3]['accountDstId'],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Account Destination Name",
                style: TextStyle(fontSize: 17),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                keyboardType: TextInputType.number,
                autocorrect: false,
                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: data[4]['accountDstName'],
                ),
              ),
              SizedBox(
                height: 15,
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
                autocorrect: false,
                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: "Rp.${data[5]['amount']}",
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color(0xff54BAB9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
                onPressed: () {
                  controller.confirm();
                },
                child: Text("Confirm"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
