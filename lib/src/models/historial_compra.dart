// To parse this JSON data, do
//
//     final historialCompraModel = historialCompraModelFromMap(jsonString);

import 'dart:convert';

class HistorialCompraModel {
  HistorialCompraModel({
    this.compras,
    this.pag = 0,
    this.pags = 0,
    this.sizePage = 10,
    this.totals = 0,
    this.mensjae,
  });

  List<Compra>? compras;
  int pag;
  int pags;
  int sizePage;
  int totals;
  String? mensjae;

  HistorialCompraModel copyWith({
    List<Compra>? compras,
    int? pag,
    int? pags,
    int? sizePage,
    int? totals,
    String? mensjae,
  }) =>
      HistorialCompraModel(
        compras: compras ?? this.compras,
        pag: pag ?? this.pag,
        pags: pags ?? this.pags,
        sizePage: sizePage ?? this.sizePage,
        totals: totals ?? this.totals,
        mensjae: mensjae ?? this.mensjae,
      );

  factory HistorialCompraModel.fromJson(String str) =>
      HistorialCompraModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HistorialCompraModel.fromMap(Map<String, dynamic> json) =>
      HistorialCompraModel(
        compras: json["compras"] == null
            ? null
            : List<Compra>.from(json["compras"].map((x) => Compra.fromMap(x))),
        pag: json["pag"],
        pags: json["pags"],
        sizePage: json["sizePage"],
        totals: json["totals"],
        mensjae: json["mensjae"],
      );

  Map<String, dynamic> toMap() => {
        "compras": List<dynamic>.from(compras?.map((x) => x.toMap()) ?? []),
        "pag": pag,
        "pags": pags,
        "sizePage": sizePage,
        "totals": totals,
        "mensjae": mensjae,
      };
}

class Compra {
  Compra({
    this.id = 0,
    this.cantidad = 0,
    this.amount = 0,
    this.usuarioId = 0,
    this.planId = 0,
    this.fechaCompra,
  });

  int id;
  int cantidad;
  int amount;
  int usuarioId;
  int planId;
  DateTime? fechaCompra;

  Compra copyWith({
    int? id,
    int? cantidad,
    int? amount,
    int? usuarioId,
    int? planId,
    DateTime? fechaCompra,
  }) =>
      Compra(
        id: id ?? this.id,
        cantidad: cantidad ?? this.cantidad,
        amount: amount ?? this.amount,
        usuarioId: usuarioId ?? this.usuarioId,
        planId: planId ?? this.planId,
        fechaCompra: fechaCompra ?? this.fechaCompra,
      );

  factory Compra.fromJson(String str) => Compra.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Compra.fromMap(Map<String, dynamic> json) => Compra(
        id: json["id"],
        cantidad: json["cantidad"],
        amount: json["amount"],
        usuarioId: json["usuario_id"],
        planId: json["plan_id"],
        fechaCompra: json["fecha_compra"] == null
            ? null
            : DateTime.parse(json["fecha_compra"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "cantidad": cantidad,
        "amount": amount,
        "usuario_id": usuarioId,
        "plan_id": planId,
        "fecha_compra": fechaCompra?.toIso8601String(),
      };
}
