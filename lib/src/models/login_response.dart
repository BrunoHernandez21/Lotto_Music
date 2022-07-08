import 'dart:convert';

class LoginResponse {
  LoginResponse({
    this.accessToken = "",
    this.tokenType = "",
    this.expiresIn,
    this.mensaje,
  });

  String accessToken;
  String tokenType;
  DateTime? expiresIn;
  String? mensaje;

  LoginResponse copyWith({
    String? accessToken,
    String? tokenType,
    DateTime? expiresIn,
    String? mensaje,
  }) =>
      LoginResponse(
          accessToken: accessToken ?? this.accessToken,
          tokenType: tokenType ?? this.tokenType,
          expiresIn: expiresIn ?? this.expiresIn,
          mensaje: mensaje ?? this.mensaje);

  factory LoginResponse.fromJson(String str) =>
      LoginResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginResponse.fromMap(Map<String, dynamic> json) => LoginResponse(
        accessToken: json["access_token"] ?? "",
        tokenType: json["token_type"] ?? "",
        mensaje: json["mensaje"],
        expiresIn: json["expires_in"] == null
            ? null
            : DateTime.parse(json["expires_in"]),
      );

  Map<String, dynamic> toMap() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "mensaje": mensaje,
        "expires_in": expiresIn?.toIso8601String(),
      };
}
