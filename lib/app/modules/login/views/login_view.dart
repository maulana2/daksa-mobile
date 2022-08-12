import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F7F7),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20),
              height: 350,
              decoration: const BoxDecoration(
                color: Color(0xff54BAB9),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(80),
                  bottomLeft: Radius.circular(80),
                ),
              ),
              child: Column(
                children: [
                  const Center(
                      child: Text(
                    "Welcome",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset('assets/login-images.png'),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  TextField(
                    autocorrect: false,
                    controller: controller.usernameC,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person_remove),
                      hintText: "Username",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    autocorrect: false,
                    obscureText: true,
                    controller: controller.passwordC,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.key),
                      hintText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.login();
                    },
                    child: const Text("Login"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
