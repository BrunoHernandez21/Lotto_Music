// To parse this JSON data, do
//
//     final apuestaModel = apuestaModelFromMap(jsonString);

import 'dart:convert';

class ApuestaModel {
  ApuestaModel({
    this.id = 0,
    this.activo = false,
    this.cantidad = 0,
    this.comentarios = 0,
    this.likes = 0,
    this.vistas = 0,
    this.dislikes = 0,
    this.usuarioId = 0,
    this.apuestaId = 0,
    this.mensaje,
  });

  int id;
  bool activo;
  int cantidad;
  int comentarios;
  int likes;
  int vistas;
  int dislikes;
  int usuarioId;
  int apuestaId;
  String? mensaje;

  ApuestaModel copyWith({
    int? id,
    bool? activo,
    int? cantidad,
    int? comentarios,
    int? likes,
    int? vistas,
    int? dislikes,
    int? usuarioId,
    int? apuestaId,
    String? mensaje,
  }) =>
      ApuestaModel(
          id: id ?? this.id,
          activo: activo ?? this.activo,
          cantidad: cantidad ?? this.cantidad,
          comentarios: comentarios ?? this.comentarios,
          likes: likes ?? this.likes,
          vistas: vistas ?? this.vistas,
          dislikes: dislikes ?? this.dislikes,
          usuarioId: usuarioId ?? this.usuarioId,
          apuestaId: apuestaId ?? this.apuestaId,
          mensaje: mensaje ?? this.mensaje);

  factory ApuestaModel.fromJson(String str) =>
      ApuestaModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ApuestaModel.fromMap(Map<String, dynamic> json) => ApuestaModel(
        id: json["id"] ?? 0,
        activo: json["activo"] ?? false,
        cantidad: json["cantidad"] ?? 0,
        comentarios: json["comentarios"] ?? 0,
        likes: json["likes"] ?? 0,
        vistas: json["vistas"] ?? 0,
        dislikes: json["dislikes"] ?? 0,
        usuarioId: json["usuario_id"] ?? 0,
        apuestaId: json["apuesta_id"] ?? 0,
        mensaje: json["mensaje"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "activo": activo,
        "cantidad": cantidad,
        "comentarios": comentarios,
        "likes": likes,
        "vistas": vistas,
        "dislikes": dislikes,
        "usuario_id": usuarioId,
        "apuesta_id": apuestaId,
        "mensaje": mensaje,
      };
}
