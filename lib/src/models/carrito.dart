// To parse this JSON data, do
//
//     final carritoModel = carritoModelFromMap(jsonString);

import 'dart:convert';
import 'package:intl/intl.dart';

class CarritoModel {
  CarritoModel({
    this.id = 0,
    this.activa = true,
    this.cantidad = 1,
    this.amount = 0,
    this.fechaOrden,
    this.idCharges,
    this.ordenStatus = "",
    this.idPlan = 0,
    this.usuarioId = 0,
    this.mensaje,
  });

  int id;
  bool activa;
  int cantidad;
  int amount;
  DateTime? fechaOrden;
  String? idCharges;
  String ordenStatus;
  String? mensaje;
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
    String? mensaje,
    int? idPlan,
    int? usuarioId,
  }) =>
      CarritoModel(
        id: id ?? this.id,
        mensaje: mensaje ?? this.mensaje,
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
        id: json["id"] ?? 0,
        mensaje: json["mensaje"],
        activa: json["activa"] ?? false,
        cantidad: json["cantidad"] ?? 0,
        amount: json["amount"] ?? 0,
        fechaOrden: json["fecha_orden"] == null
            ? null
            : DateTime.parse(json["fecha_orden"]),
        idCharges: json["id_charges"],
        ordenStatus: json["orden_status"] ?? "",
        idPlan: json["id_plan"] ?? 0,
        usuarioId: json["usuario_id"] ?? 0,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "mensaje": mensaje,
        "activa": activa,
        "cantidad": cantidad,
        "amount": amount,
        "fecha_orden": fechaOrden == null
            ? null
            : DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(fechaOrden!),
        "id_charges": idCharges,
        "orden_status": ordenStatus,
        "id_plan": idPlan,
        "usuario_id": usuarioId,
      };
}
