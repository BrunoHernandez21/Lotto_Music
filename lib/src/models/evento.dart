// To parse this JSON data, do
//
//     final eventoModel = eventoModelFromMap(jsonString);

import 'dart:convert';

class EventoModel {
  EventoModel({
    this.id = 0,
    this.activo = true,
    this.fechahoraapuesta,
    this.precio = 0,
    this.acumulado = 0,
    this.premio = "",
    this.categoriaApuestaId = 0,
    this.tipoApuestaId = 0,
    this.videoId = 0,
  });

  int id;
  bool activo;
  DateTime? fechahoraapuesta;
  int precio;
  int acumulado;
  String premio;
  int categoriaApuestaId;
  int tipoApuestaId;
  int videoId;

  EventoModel copyWith({
    int? id,
    bool? activo,
    DateTime? fechahoraapuesta,
    int? precio,
    int? acumulado,
    String? premio,
    int? categoriaApuestaId,
    int? tipoApuestaId,
    int? videoId,
  }) =>
      EventoModel(
        id: id ?? this.id,
        activo: activo ?? this.activo,
        fechahoraapuesta: fechahoraapuesta ?? this.fechahoraapuesta,
        precio: precio ?? this.precio,
        acumulado: acumulado ?? this.acumulado,
        premio: premio ?? this.premio,
        categoriaApuestaId: categoriaApuestaId ?? this.categoriaApuestaId,
        tipoApuestaId: tipoApuestaId ?? this.tipoApuestaId,
        videoId: videoId ?? this.videoId,
      );

  factory EventoModel.fromJson(String str) =>
      EventoModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EventoModel.fromMap(Map<String, dynamic> json) => EventoModel(
        id: json["id"],
        activo: json["activo"],
        fechahoraapuesta: DateTime.parse(json["fechahoraapuesta"]),
        precio: json["precio"],
        acumulado: json["acumulado"],
        premio: json["premio"],
        categoriaApuestaId: json["categoria_apuesta_id"],
        tipoApuestaId: json["tipo_apuesta_id"],
        videoId: json["video_id"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "activo": activo,
        "fechahoraapuesta": fechahoraapuesta?.toIso8601String(),
        "precio": precio,
        "acumulado": acumulado,
        "premio": premio,
        "categoria_apuesta_id": categoriaApuestaId,
        "tipo_apuesta_id": tipoApuestaId,
        "video_id": videoId,
      };
}
