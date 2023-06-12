import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Data/jwt_data_from_service.dart';
import '../UI/Screen/after_login_page_go.dart';

class AuthController extends GetxController {
  String? email;
  String? password;

  void setEmail(String value) {
    email = value;
  }

  void setPassword(String value) {
    password = value;
  }

  Future<void> login() async {
    // القيام بعملية التحقق من صحة بيانات المستخدم هنا
    // إذا كانت البيانات صحيحة ، فيجب عليك تخزين حالة تسجيل الدخول لاحقًا باستخدام حزمة get_storage أو أي حزمة مشابهة
    final String _baseUrl =
        'http://localhost:9098/myapp238/api/v1/auth/authenticate';
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
    };

    final url = Uri.parse(_baseUrl); //  ,
    final resp = await http.post(url, body: json.encode(authData), headers: {
      'Content-Type': 'application/json;charset=utf-8',
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'POST, GET, OPTIONS, PUT, DELETE, HEAD'
    });
    print(resp.body);
    print(resp.body);
    Token.fromJson(resp.body as Map<String, dynamic>);
    //  tokenToJson(resp.body as Token);
    //Token
    if (resp.statusCode == 200) {
      Get.to(AfterPage());
      /*

       */
    } else {
/*
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('$item dismissed')),
      );

 */
      print("con not go ");
    }
  }
}
