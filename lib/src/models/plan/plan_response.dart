// To parse this JSON data, do
//
//     final planResponse = planResponseFromMap(jsonString);

import 'dart:convert';

import 'package:lotto_music/src/models/plan/plan.dart';

class PlanesResponse {
  PlanesResponse({
    this.planes,
    this.mensaje,
  });

  List<PlanModel>? planes;
  String? mensaje;

  PlanesResponse copyWith({
    List<PlanModel>? planes,
    String? mensaje,
  }) =>
      PlanesResponse(
        planes: planes ?? this.planes,
        mensaje: mensaje ?? this.mensaje,
      );

  factory PlanesResponse.fromJson(String str) =>
      PlanesResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PlanesResponse.fromMap(Map<String, dynamic> json) => PlanesResponse(
        planes: List<PlanModel>.from(
            json["planes"].map((x) => PlanModel.fromMap(x))),
        mensaje: json["mensaje"],
      );

  Map<String, dynamic> toMap() => {
        "planes": List<dynamic>.from(planes?.map((x) => x.toMap()) ?? []),
        "mensaje": mensaje,
      };
}
