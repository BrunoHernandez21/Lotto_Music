// To parse this JSON data, do
//
//     final apuestaModel = apuestaModelFromMap(jsonString);

import 'dart:convert';

class ApuestaModel {
  ApuestaModel({
    this.id = 0,
    this.activo = true,
    this.fecha,
    this.vistas = 0,
    this.usuarioId = 0,
    this.apuestaId = 0,
    this.comentarios = 0,
    this.likes = 0,
    this.dislikes = 0,
  });

  int id;
  bool activo;
  DateTime? fecha;
  int vistas;
  int usuarioId;
  int apuestaId;
  int comentarios;
  int likes;
  int dislikes;

  ApuestaModel copyWith({
    int? id,
    bool? activo,
    DateTime? fecha,
    int? vistas,
    int? usuarioId,
    int? apuestaId,
    int? comentarios,
    int? likes,
    int? dislikes,
  }) =>
      ApuestaModel(
        id: id ?? this.id,
        activo: activo ?? this.activo,
        fecha: fecha ?? this.fecha,
        vistas: vistas ?? this.vistas,
        usuarioId: usuarioId ?? this.usuarioId,
        apuestaId: apuestaId ?? this.apuestaId,
        comentarios: comentarios ?? this.comentarios,
        likes: likes ?? this.likes,
        dislikes: dislikes ?? this.dislikes,
      );

  factory ApuestaModel.fromJson(String str) =>
      ApuestaModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ApuestaModel.fromMap(Map<String, dynamic> json) => ApuestaModel(
        id: json["id"],
        activo: json["activo"],
        fecha: DateTime.parse(json["fecha"]),
        vistas: json["vistas"],
        usuarioId: json["usuario_id"],
        apuestaId: json["apuesta_id"],
        comentarios: json["comentarios"],
        likes: json["likes"],
        dislikes: json["dislikes"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "activo": activo,
        "fecha": fecha?.toIso8601String(),
        "vistas": vistas,
        "usuario_id": usuarioId,
        "apuesta_id": apuestaId,
        "comentarios": comentarios,
        "likes": likes,
        "dislikes": dislikes,
      };
}
