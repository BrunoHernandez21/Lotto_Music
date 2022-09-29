// To parse this JSON data, do
//
//     final ganadorModel = ganadorModelFromMap(jsonString);

import 'dart:convert';

class GanadorModel {
  GanadorModel({
    this.id = 0,
    this.cantidad = 0,
    this.concepto = "",
    this.eventoId = 0,
    this.usuarioId = 0,
    this.eventoUsuarioId = 0,
  });

  int id;
  int cantidad;
  String concepto;
  int eventoId;
  int usuarioId;
  int eventoUsuarioId;

  GanadorModel copyWith({
    int? id,
    int? cantidad,
    String? concepto,
    int? eventoId,
    int? usuarioId,
    int? eventoUsuarioId,
  }) =>
      GanadorModel(
        id: id ?? this.id,
        cantidad: cantidad ?? this.cantidad,
        concepto: concepto ?? this.concepto,
        eventoId: eventoId ?? this.eventoId,
        usuarioId: usuarioId ?? this.usuarioId,
        eventoUsuarioId: eventoUsuarioId ?? this.eventoUsuarioId,
      );

  factory GanadorModel.fromJson(String str) {
    try {
      return GanadorModel.fromMap(json.decode(str));
    } catch (e) {
      return GanadorModel();
    }
  }

  String toJson() => json.encode(toMap());

  factory GanadorModel.fromMap(Map<String, dynamic> json) => GanadorModel(
        id: json["id"] ?? 0,
        cantidad: json["cantidad"] ?? 0,
        concepto: json["concepto"] ?? "",
        eventoId: json["evento_id"] ?? 0,
        usuarioId: json["usuario_id"] ?? 0,
        eventoUsuarioId: json["evento_usuario_id"] ?? 0,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "cantidad": cantidad,
        "concepto": concepto,
        "evento_id": eventoId,
        "usuario_id": usuarioId,
        "evento_usuario_id": eventoUsuarioId,
      };
}
