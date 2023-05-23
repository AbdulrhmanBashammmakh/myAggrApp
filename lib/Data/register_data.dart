// To parse this JSON data, do
//
//     final register = registerFromJson(jsonString);

import 'dart:convert';

Register registerFromJson(String str) => Register.fromJson(json.decode(str));

String registerToJson(Register data) => json.encode(data.toJson());

class Register {
  String firstname;
  String lastname;
  String email;
  String password;

  Register({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.password,
  });

  factory Register.fromJson(Map<String, dynamic> json) => Register(
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "password": password,
      };
}
