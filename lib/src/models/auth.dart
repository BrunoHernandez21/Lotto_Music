// To parse this JSON data, do
//
//     final authModel = authModelFromMap(jsonString);

import 'dart:convert';

class AuthModel {
  AuthModel({
    this.accessToken = "",
    this.tokenType = "",
    this.expiresIn,
  });

  String accessToken;
  String tokenType;
  DateTime? expiresIn;

  AuthModel copyWith({
    String? accessToken,
    String? tokenType,
    DateTime? expiresIn,
  }) =>
      AuthModel(
        accessToken: accessToken ?? this.accessToken,
        tokenType: tokenType ?? this.tokenType,
        expiresIn: expiresIn ?? this.expiresIn,
      );

  factory AuthModel.fromJson(String str) => AuthModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthModel.fromMap(Map<String, dynamic> json) => AuthModel(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: DateTime.parse(json["expires_in"]),
      );

  Map<String, dynamic> toMap() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_in": expiresIn?.toIso8601String(),
      };
}
