// To parse this JSON data, do
//
//     final planModel = planModelFromMap(jsonString);

import 'dart:convert';

class VideosModel {
  VideosModel({
    this.id = 0,
    this.activo = true,
    this.artista = "",
    this.canal = "",
    this.fechaVideo,
    this.idVideo = "",
    this.titulo = "",
    this.urlVideo = "",
    this.thumblary = "",
  });

  int id;
  bool activo;
  String artista;
  String canal;
  DateTime? fechaVideo;
  String idVideo;
  String titulo;
  String urlVideo;
  String thumblary;

  VideosModel copyWith({
    int? id,
    bool? activo,
    String? artista,
    String? canal,
    DateTime? fechaVideo,
    String? idVideo,
    String? titulo,
    String? urlVideo,
    String? thumblary,
  }) =>
      VideosModel(
        id: id ?? this.id,
        activo: activo ?? this.activo,
        artista: artista ?? this.artista,
        canal: canal ?? this.canal,
        fechaVideo: fechaVideo ?? this.fechaVideo,
        idVideo: idVideo ?? this.idVideo,
        titulo: titulo ?? this.titulo,
        urlVideo: urlVideo ?? this.urlVideo,
        thumblary: thumblary ?? this.thumblary,
      );

  factory VideosModel.fromJson(String str) =>
      VideosModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VideosModel.fromMap(Map<String, dynamic> json) => VideosModel(
        id: json["id"],
        activo: json["activo"],
        artista: json["Artista"],
        canal: json["Canal"],
        fechaVideo: DateTime.parse(json["Fecha_video"]),
        idVideo: json["Id_video"],
        titulo: json["Titulo"],
        urlVideo: json["Url_video"],
        thumblary: json["thumblary"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "activo": activo,
        "Artista": artista,
        "Canal": canal,
        "Fecha_video": fechaVideo?.toIso8601String(),
        "Id_video": idVideo,
        "Titulo": titulo,
        "Url_video": urlVideo,
        "thumblary": thumblary,
      };
}
