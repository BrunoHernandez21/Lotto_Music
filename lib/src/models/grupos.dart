// To parse this JSON data, do
//
//     final gruposModel = gruposModelFromMap(jsonString);

import 'dart:convert';

class GruposModel {
  GruposModel({
    this.grupos,
    this.mensaje,
  });

  List<String>? grupos;
  String? mensaje;

  GruposModel copyWith({
    List<String>? grupos,
    String? mensaje,
  }) =>
      GruposModel(
        grupos: grupos ?? this.grupos,
        mensaje: mensaje ?? this.mensaje,
      );

  factory GruposModel.fromJson(String str) =>
      GruposModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GruposModel.fromMap(Map<String, dynamic> json) => GruposModel(
        grupos: List<String>.from(json["grupos"].map((x) => x)),
        mensaje: json["mensaje"],
      );

  Map<String, dynamic> toMap() => {
        "grupos": List<dynamic>.from(grupos?.map((x) => x) ?? []),
        "mensaje": mensaje,
      };
}
