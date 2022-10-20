// To parse this JSON data, do
//
//     final compraModel = compraModelFromMap(jsonString);

import 'dart:convert';

class CompraModel {
  CompraModel({
    this.id = 0,
    this.fechaPagado,
    this.isError = false,
    this.status,
    this.fechaEmitido,
    this.precioTotal,
    this.puntosTotal,
  });

  final int id;
  final DateTime? fechaPagado;
  final bool isError;
  final String? status;
  final DateTime? fechaEmitido;
  final int? precioTotal;
  final int? puntosTotal;

  CompraModel copyWith({
    int? id,
    DateTime? fechaPagado,
    bool? isError,
    String? status,
    DateTime? fechaEmitido,
    int? precioTotal,
    int? puntosTotal,
  }) =>
      CompraModel(
        id: id ?? this.id,
        fechaPagado: fechaPagado ?? this.fechaPagado,
        isError: isError ?? this.isError,
        status: status ?? this.status,
        fechaEmitido: fechaEmitido ?? this.fechaEmitido,
        precioTotal: precioTotal ?? this.precioTotal,
        puntosTotal: puntosTotal ?? this.puntosTotal,
      );

  factory CompraModel.fromJson(String str) =>
      CompraModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CompraModel.fromMap(Map<String, dynamic> json) => CompraModel(
        id: json["id"] ?? 0,
        fechaPagado: DateTime.parse(json["fecha_pagado"]),
        isError: json["is_error"] ?? true,
        status: json["status"],
        fechaEmitido: DateTime.parse(json["fecha_emitido"]),
        precioTotal: json["precio_total"],
        puntosTotal: json["puntos_total"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "fecha_pagado": fechaPagado?.toIso8601String(),
        "is_error": isError,
        "status": status,
        "fecha_emitido": fechaEmitido?.toIso8601String(),
        "precio_total": precioTotal,
        "puntos_total": puntosTotal,
      };
}
