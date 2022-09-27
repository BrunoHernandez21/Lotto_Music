// To parse this JSON data, do
//
//     final compraModel = compraModelFromMap(jsonString);

import 'dart:convert';

class CompraModel {
  CompraModel({
    this.id = 0,
    this.fechaPagado,
    this.stripeId,
    this.status,
    this.fechaEmitido,
    this.impuesto,
    this.subTotal,
    this.descuentoOrden,
    this.total = 0,
    this.paymentMethodId = 0,
  });

  int id;
  DateTime? fechaPagado;
  String? stripeId;
  String? status;
  DateTime? fechaEmitido;
  int? impuesto;
  int? subTotal;
  int? descuentoOrden;
  int total;
  int paymentMethodId;

  CompraModel copyWith({
    int? id,
    DateTime? fechaPagado,
    String? stripeId,
    String? status,
    DateTime? fechaEmitido,
    int? impuesto,
    int? subTotal,
    int? descuentoOrden,
    int? total,
    int? paymentMethodId,
  }) =>
      CompraModel(
        id: id ?? this.id,
        fechaPagado: fechaPagado ?? this.fechaPagado,
        stripeId: stripeId ?? this.stripeId,
        status: status ?? this.status,
        fechaEmitido: fechaEmitido ?? this.fechaEmitido,
        impuesto: impuesto ?? this.impuesto,
        subTotal: subTotal ?? this.subTotal,
        descuentoOrden: descuentoOrden ?? this.descuentoOrden,
        total: total ?? this.total,
        paymentMethodId: paymentMethodId ?? this.paymentMethodId,
      );

  factory CompraModel.fromJson(String str) {
    try {
      return CompraModel.fromMap(json.decode(str));
    } catch (e) {
      return CompraModel();
    }
  }

  String toJson() => json.encode(toMap());

  factory CompraModel.fromMap(Map<String, dynamic> json) => CompraModel(
        id: json["id"] ?? 0,
        fechaPagado: DateTime.parse(json["fecha_pagado"]),
        stripeId: json["stripe_id"],
        status: json["status"],
        fechaEmitido: DateTime.parse(json["fecha_emitido"]),
        impuesto: json["impuesto"],
        subTotal: json["sub_total"],
        descuentoOrden: json["descuento_orden"],
        total: json["total"] ?? 0,
        paymentMethodId: json["payment_method_id"] ?? 0,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "fecha_pagado": fechaPagado?.toIso8601String(),
        "stripe_id": stripeId,
        "status": status,
        "fecha_emitido": fechaEmitido?.toIso8601String(),
        "impuesto": impuesto,
        "sub_total": subTotal,
        "descuento_orden": descuentoOrden,
        "total": total,
        "payment_method_id": paymentMethodId,
      };
}
