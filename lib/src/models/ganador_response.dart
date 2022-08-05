// To parse this JSON data, do
//
//     final ganadorResponse = ganadorResponseFromMap(jsonString);

import 'dart:convert';

import 'ganador.dart';

class GanadorResponse {
  GanadorResponse({
    this.ganador,
    this.pag = 0,
    this.pags = 0,
    this.sizePage,
    this.totals,
  });

  List<GanadorModel>? ganador;
  int pag;
  int pags;
  int? sizePage;
  int? totals;

  GanadorResponse copyWith({
    List<GanadorModel>? ganador,
    int? pag,
    int? pags,
    int? sizePage,
    int? totals,
  }) =>
      GanadorResponse(
        ganador: ganador ?? this.ganador,
        pag: pag ?? this.pag,
        pags: pags ?? this.pags,
        sizePage: sizePage ?? this.sizePage,
        totals: totals ?? this.totals,
      );

  factory GanadorResponse.fromJson(String str) =>
      GanadorResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GanadorResponse.fromMap(Map<String, dynamic> json) => GanadorResponse(
        ganador: List<GanadorModel>.from(
            json["ganador"].map((x) => GanadorModel.fromMap(x))),
        pag: json["pag"],
        pags: json["pags"],
        sizePage: json["sizePage"],
        totals: json["totals"],
      );

  Map<String, dynamic> toMap() => {
        "ganador": List<dynamic>.from(ganador?.map((x) => x.toMap()) ?? []),
        "pag": pag,
        "pags": pags,
        "sizePage": sizePage,
        "totals": totals,
      };
}
