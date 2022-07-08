import 'dart:convert';

class VideoModel {
  VideoModel({
    this.id = 0,
    this.activo = true,
    this.artista = "",
    this.canal = "",
    this.fechaVideo,
    this.idVideo = "",
    this.titulo = "",
    this.urlVideo = "",
    this.thumblary = "",
    this.genero = "",
  });

  int id;
  bool activo;
  String? artista;
  String? canal;
  DateTime? fechaVideo;
  String? idVideo;
  String? titulo;
  String? urlVideo;
  String? thumblary;
  String? genero;

  VideoModel copyWith({
    int? id,
    bool? activo,
    String? artista,
    String? canal,
    DateTime? fechaVideo,
    String? idVideo,
    String? titulo,
    String? urlVideo,
    String? thumblary,
    String? genero,
  }) =>
      VideoModel(
        id: id ?? this.id,
        activo: activo ?? this.activo,
        artista: artista ?? this.artista,
        canal: canal ?? this.canal,
        fechaVideo: fechaVideo ?? this.fechaVideo,
        idVideo: idVideo ?? this.idVideo,
        titulo: titulo ?? this.titulo,
        urlVideo: urlVideo ?? this.urlVideo,
        thumblary: thumblary ?? this.thumblary,
        genero: genero ?? this.genero,
      );

  factory VideoModel.fromJson(String str) =>
      VideoModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VideoModel.fromMap(Map<String, dynamic> json) => VideoModel(
        id: json["id"],
        activo: json["activo"],
        artista: json["artista"],
        canal: json["canal"],
        fechaVideo: json["fecha_video"] == null
            ? null
            : DateTime.parse(json["fecha_video"]),
        idVideo: json["id_video"],
        titulo: json["titulo"],
        urlVideo: json["url_video"],
        thumblary: json["thumblary"],
        genero: json["genero"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "activo": activo,
        "artista": artista,
        "canal": canal,
        "fecha_video": fechaVideo?.toIso8601String(),
        "id_video": idVideo,
        "titulo": titulo,
        "url_video": urlVideo,
        "thumblary": thumblary,
        "genero": genero,
      };
}
