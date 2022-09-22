// To parse this JSON data, do
//
//     final carteraModel = carteraModelFromMap(jsonString);

import 'dart:convert';

class CarteraModel {
  CarteraModel({
    this.id = 0,
    this.puntos = 0,
    this.saldoMxn = 0,
    this.saldoUsd = 0,
    this.usuarioId = 0,
  });

  int id;
  int puntos;
  int saldoMxn;
  int saldoUsd;
  int usuarioId;

  CarteraModel copyWith({
    int? id,
    int? puntos,
    int? saldoMxn,
    int? saldoUsd,
    int? usuarioId,
  }) =>
      CarteraModel(
        id: id ?? this.id,
        puntos: puntos ?? this.puntos,
        saldoMxn: saldoMxn ?? this.saldoMxn,
        saldoUsd: saldoUsd ?? this.saldoUsd,
        usuarioId: usuarioId ?? this.usuarioId,
      );

  factory CarteraModel.fromJson(String str) =>
      CarteraModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CarteraModel.fromMap(Map<String, dynamic> json) => CarteraModel(
        id: json["id"] ?? 0,
        puntos: json["puntos"] ?? 0,
        saldoMxn: json["saldo_mxn"] ?? 0,
        saldoUsd: json["saldo_usd"] ?? 0,
        usuarioId: json["usuario_id"] ?? 0,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "puntos": puntos,
        "saldo_mxn": saldoMxn,
        "saldo_usd": saldoUsd,
        "usuario_id": usuarioId,
      };
}
