// To parse this JSON data, do
//
//     final paymentIntentResponse = paymentIntentResponseFromMap(jsonString);

import 'dart:convert';

class PaymentIntentResponse {
  PaymentIntentResponse({
    this.amount = 0,
    this.id = "",
    this.clientSecret = "",
    this.status = "",
    this.mensaje,
  });

  final int amount;
  final String id;
  final String clientSecret;
  final String status;
  final String? mensaje;

  PaymentIntentResponse copyWith(
          {int? amount,
          String? id,
          String? clientSecret,
          String? status,
          String? mensaje}) =>
      PaymentIntentResponse(
        amount: amount ?? this.amount,
        id: id ?? this.id,
        clientSecret: clientSecret ?? this.clientSecret,
        status: status ?? this.status,
        mensaje: mensaje ?? this.mensaje,
      );

  factory PaymentIntentResponse.fromJson(String str) =>
      PaymentIntentResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PaymentIntentResponse.fromMap(Map<String, dynamic> json) =>
      PaymentIntentResponse(
        amount: json["amount"] ?? 0,
        id: json["id"] ?? "",
        clientSecret: json["client_secret"] ?? "",
        status: json["status"] ?? "",
        mensaje: json["mensaje"],
      );

  Map<String, dynamic> toMap() => {
        "amount": amount,
        "id": id,
        "client_secret": clientSecret,
        "status": status,
        "mensaje": mensaje,
      };
}
