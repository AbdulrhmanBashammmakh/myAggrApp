// To parse this JSON data, do
//
//     final payload = payloadFromJson(jsonString);

import 'dart:convert';

Payload payloadFromJson(String str) => Payload.fromJson(json.decode(str));

String payloadToJson(Payload data) => json.encode(data.toJson());

class Payload {
  String sub;
  int iat;
  int exp;

  Payload({
    required this.sub,
    required this.iat,
    required this.exp,
  });

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        sub: json["sub"],
        iat: json["iat"],
        exp: json["exp"],
      );

  Map<String, dynamic> toJson() => {
        "sub": sub,
        "iat": iat,
        "exp": exp,
      };
}
