// To parse this JSON data, do
//
//     final carteraModel = carteraModelFromMap(jsonString);

import 'dart:convert';

class Cartera {
  Cartera({
    this.id = 0,
    this.mensaje,
    this.cash = 0,
  });

  int id;
  String? mensaje;
  int cash;

  Cartera copyWith({
    int? id,
    String? mensaje,
    int? cash,
  }) =>
      Cartera(
        id: id ?? this.id,
        mensaje: mensaje ?? this.mensaje,
        cash: cash ?? this.cash,
      );

  factory Cartera.fromJson(String str) => Cartera.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Cartera.fromMap(Map<String, dynamic> json) => Cartera(
        id: json["id"] ?? 0,
        mensaje: json["mensaje"],
        cash: json["cash"] ?? 0,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "mensaje": mensaje,
        "cash": cash,
      };
}
