import 'dart:convert';

class LoginResponse {
  LoginResponse({
    this.userId = 0,
    this.accessToken = "",
    this.tokenType = "",
    this.expiresIn,
    this.mensaje,
  });
  int userId;
  String accessToken;
  String tokenType;
  DateTime? expiresIn;
  String? mensaje;

  LoginResponse copyWith({
    int? userId,
    String? accessToken,
    String? tokenType,
    DateTime? expiresIn,
    String? mensaje,
  }) =>
      LoginResponse(
          userId: userId ?? this.userId,
          accessToken: accessToken ?? this.accessToken,
          tokenType: tokenType ?? this.tokenType,
          expiresIn: expiresIn ?? this.expiresIn,
          mensaje: mensaje ?? this.mensaje);

  factory LoginResponse.fromJson(String str) {
    try {
      return LoginResponse.fromMap(json.decode(str));
    } catch (e) {
      return LoginResponse(mensaje: "mensaje incomprensible");
    }
  }

  String toJson() => json.encode(toMap());

  factory LoginResponse.fromMap(Map<String, dynamic> json) => LoginResponse(
        userId: json["user_id"] ?? 0,
        accessToken: json["access_token"] ?? "",
        tokenType: json["token_type"] ?? "",
        mensaje: json["mensaje"],
        expiresIn: json["expires_in"] == null
            ? null
            : DateTime.parse(json["expires_in"]).toLocal(),
      );

  Map<String, dynamic> toMap() => {
        "user_id": userId,
        "access_token": accessToken,
        "token_type": tokenType,
        "mensaje": mensaje,
        "expires_in": expiresIn?.toIso8601String(),
      };
}
