// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromMap(jsonString);

import 'dart:convert';

class LoginResponse {
  LoginResponse({
    this.userId,
    this.firstName,
    this.lastName,
    this.email,
    this.role,
    required this.validity,
    this.token,
  });

  String? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? role;
  int validity;
  String? token;

  LoginResponse copyWith({
    String? userId,
    String? firstName,
    String? lastName,
    String? email,
    String? role,
    int? validity,
    String? token,
  }) =>
      LoginResponse(
        userId: userId ?? this.userId,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        role: role ?? this.role,
        validity: validity ?? this.validity,
        token: token ?? this.token,
      );

  factory LoginResponse.fromJson(String str) =>
      LoginResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginResponse.fromMap(Map<String, dynamic> json) => LoginResponse(
        userId: json["user_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        role: json["role"],
        validity: json["validity"] ?? 0,
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "user_id": userId,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "role": role,
        "validity": validity,
        "token": token,
      };
}
