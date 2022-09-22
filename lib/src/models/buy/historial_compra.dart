// To parse this JSON data, do
//
//     final historialCompraModel = historialCompraModelFromMap(jsonString);

import 'dart:convert';

import 'package:lotto_music/src/models/buy/compra.dart';

class HistorialCompraModel {
  HistorialCompraModel({
    this.compras,
    this.pag = 0,
    this.pags = 0,
    this.sizePage = 10,
    this.totals = 0,
    this.mensjae,
  });

  List<CompraModel>? compras;
  int pag;
  int pags;
  int sizePage;
  int totals;
  String? mensjae;

  HistorialCompraModel copyWith({
    List<CompraModel>? compras,
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
            : List<CompraModel>.from(
                json["compras"].map((x) => CompraModel.fromMap(x))),
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
