import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:myaggr/Controllers/login_controller.dart';

import '../../Controllers/auth_controller.dart';

class LoginPage extends GetView<SignupController> {
  LoginPage({Key? key}) : super(key: key);

  final SignupController signupController = Get.put(SignupController());
  final AuthController _authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        title: Text('Signup'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
              onChanged: (value) => _authController.email = value,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
              onChanged: (value) => _authController.password = value,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _authController.login(),
              child: Text('Signup'),
            ),
            Obx(() {
              if (controller.isLoading.value) {
                return CircularProgressIndicator();
              } else {
                return SizedBox.shrink();
              }
            }),
          ],
        ),
      ),
    );
  }

  void CheckLogin() async {
    final String _baseUrl =
        'http://localhost:9098/myapp238/api/v1/auth/authenticate';
    final Map<String, dynamic> authData = {
      'email': 'a@asdf.com',
      'password': '123456',
    };

    final url = Uri.parse(_baseUrl); //  ,
    final resp = await http.post(url, body: json.encode(authData), headers: {
      'Content-Type': 'application/json;charset=utf-8',
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'POST, GET, OPTIONS, PUT, DELETE, HEAD'
    });
    print(resp.body);
    // GotoHome();
  }
}
