// To parse this JSON data, do
//
//     final carritoModel = carritoModelFromMap(jsonString);

import 'dart:convert';

class CarritoModel {
  CarritoModel({
    this.id = 0,
    this.activa = true,
    this.cantidad = 1,
    this.amount = 0,
    this.fechaOrden,
    this.idCharges = "",
    this.ordenStatus = "",
    this.idPlan = 0,
    this.usuarioId = 0,
  });

  int id;
  bool activa;
  int cantidad;
  int amount;
  DateTime? fechaOrden;
  String idCharges;
  String ordenStatus;
  int idPlan;
  int usuarioId;

  CarritoModel copyWith({
    int? id,
    bool? activa,
    int? cantidad,
    int? amount,
    DateTime? fechaOrden,
    String? idCharges,
    String? ordenStatus,
    int? idPlan,
    int? usuarioId,
  }) =>
      CarritoModel(
        id: id ?? this.id,
        activa: activa ?? this.activa,
        cantidad: cantidad ?? this.cantidad,
        amount: amount ?? this.amount,
        fechaOrden: fechaOrden ?? this.fechaOrden,
        idCharges: idCharges ?? this.idCharges,
        ordenStatus: ordenStatus ?? this.ordenStatus,
        idPlan: idPlan ?? this.idPlan,
        usuarioId: usuarioId ?? this.usuarioId,
      );

  factory CarritoModel.fromJson(String str) =>
      CarritoModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CarritoModel.fromMap(Map<String, dynamic> json) => CarritoModel(
        id: json["id"],
        activa: json["activa"],
        cantidad: json["cantidad"],
        amount: json["amount"],
        fechaOrden: DateTime.parse(json["fecha_orden"]),
        idCharges: json["id_charges"],
        ordenStatus: json["orden_status"],
        idPlan: json["id_plan"],
        usuarioId: json["usuario_id"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "activa": activa,
        "cantidad": cantidad,
        "amount": amount,
        "fecha_orden": fechaOrden?.toIso8601String(),
        "id_charges": idCharges,
        "orden_status": ordenStatus,
        "id_plan": idPlan,
        "usuario_id": usuarioId,
      };
}
