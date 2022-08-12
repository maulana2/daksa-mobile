import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/account_controller.dart';

class AccountView extends GetView<AccountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff54BAB9),
        title: Text('AccountView'),
        centerTitle: true,
      ),
      body: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color(0xff54BAB9),
            ),
              onPressed: () {
                controller.logOut();
              },
              child: Text("Logout"))),
    );
  }
}
