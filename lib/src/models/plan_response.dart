// To parse this JSON data, do
//
//     final resp = respFromMap(jsonString);

import 'dart:convert';

import 'package:lotto_music/src/models/plan.dart';

class PlanesResponse {
  PlanesResponse({
    this.mensaje,
    this.planes = const [],
  });

  String? mensaje;
  List<PlanModel> planes;

  PlanesResponse copyWith({
    String? mensaje,
    List<PlanModel>? planes,
  }) =>
      PlanesResponse(
        mensaje: mensaje ?? this.mensaje,
        planes: planes ?? this.planes,
      );

  factory PlanesResponse.fromJson(String str) =>
      PlanesResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PlanesResponse.fromMap(Map<String, dynamic> json) => PlanesResponse(
        mensaje: json["mensaje"],
        planes: List<PlanModel>.from(
            json["planes"].map((x) => PlanModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "mensaje": mensaje,
        "planes": List<dynamic>.from(planes.map((x) => x.toMap())),
      };
}
