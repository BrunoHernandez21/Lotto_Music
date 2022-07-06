// To parse this JSON data, do
//
//     final compraModel = compraModelFromMap(jsonString);

import 'dart:convert';

class CompraModel {
  CompraModel({
    this.id = 0,
    this.cantidad = 0,
    this.amount = 0,
    this.fechaCompra,
    this.usuarioId = 0,
    this.planId = 0,
  });

  int id;
  int cantidad;
  int amount;
  DateTime? fechaCompra;
  int usuarioId;
  int planId;

  CompraModel copyWith({
    int? id,
    int? cantidad,
    int? amount,
    DateTime? fechaCompra,
    int? usuarioId,
    int? planId,
  }) =>
      CompraModel(
        id: id ?? this.id,
        cantidad: cantidad ?? this.cantidad,
        amount: amount ?? this.amount,
        fechaCompra: fechaCompra ?? this.fechaCompra,
        usuarioId: usuarioId ?? this.usuarioId,
        planId: planId ?? this.planId,
      );

  factory CompraModel.fromJson(String str) =>
      CompraModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CompraModel.fromMap(Map<String, dynamic> json) => CompraModel(
        id: json["id"],
        cantidad: json["cantidad"],
        amount: json["amount"],
        fechaCompra: DateTime.parse(json["Fecha_compra"]),
        usuarioId: json["Usuario_id"],
        planId: json["plan_id"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "cantidad": cantidad,
        "amount": amount,
        "Fecha_compra": fechaCompra?.toIso8601String(),
        "Usuario_id": usuarioId,
        "plan_id": planId,
      };
}
