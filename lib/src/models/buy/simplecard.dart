// To parse this JSON data, do
//
//     final paymentResponse = paymentResponseFromMap(jsonString);

import 'dart:convert';

class MyPaymentResponse {
  MyPaymentResponse({
    this.mensaje,
    this.expMonth,
    this.expYear,
    this.last4,
  });

  final String? mensaje;
  final int? expMonth;
  final int? expYear;
  final String? last4;

  MyPaymentResponse copyWith({
    String? mensaje,
    int? expMonth,
    int? expYear,
    String? last4,
  }) =>
      MyPaymentResponse(
        mensaje: mensaje ?? this.mensaje,
        expMonth: expMonth ?? this.expMonth,
        expYear: expYear ?? this.expYear,
        last4: last4 ?? this.last4,
      );

  factory MyPaymentResponse.fromJson(String str) {
    try {
      return MyPaymentResponse.fromMap(json.decode(str));
    } catch (e) {
      return MyPaymentResponse(mensaje: "Parse error");
    }
  }

  String toJson() => json.encode(toMap());

  factory MyPaymentResponse.fromMap(Map<String, dynamic> json) =>
      MyPaymentResponse(
        mensaje: json["mensaje"],
        expMonth: json["exp_month"],
        expYear: json["exp_year"],
        last4: json["last4"],
      );

  Map<String, dynamic> toMap() => {
        "mensaje": mensaje,
        "exp_month": expMonth,
        "exp_year": expYear,
        "last4": last4,
      };
}
