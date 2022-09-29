// To parse this JSON data, do
//
//     final videoEventModel = videoEventModelFromMap(jsonString);

import 'dart:convert';

class VideoEventModel {
  VideoEventModel({
    this.mensaje,
    this.items,
    this.pag = 0,
    this.pags = 0,
    this.sizePage = 0,
    this.totals = 0,
  });

  final String? mensaje;
  final List<ItemEvent>? items;
  final int pag;
  final int pags;
  final int sizePage;
  final int totals;

  VideoEventModel copyWith({
    String? mensaje,
    List<ItemEvent>? items,
    int? pag,
    int? pags,
    int? sizePage,
    int? totals,
  }) =>
      VideoEventModel(
        mensaje: mensaje ?? this.mensaje,
        items: items ?? this.items,
        pag: pag ?? this.pag,
        pags: pags ?? this.pags,
        sizePage: sizePage ?? this.sizePage,
        totals: totals ?? this.totals,
      );

  factory VideoEventModel.fromJson(String str) {
    try {
      return VideoEventModel.fromMap(json.decode(str));
    } catch (e) {
      return VideoEventModel(mensaje: "mensaje incomprensible");
    }
  }

  String toJson() => json.encode(toMap());

  factory VideoEventModel.fromMap(Map<String, dynamic> json) => VideoEventModel(
        mensaje: json["mensaje"],
        items: json["items"] == null
            ? null
            : List<ItemEvent>.from(
                json["items"].map((x) => ItemEvent.fromMap(x))),
        pag: json["pag"] ?? 0,
        pags: json["pags"] ?? 0,
        sizePage: json["sizePage"] ?? 0,
        totals: json["totals"] ?? 0,
      );

  Map<String, dynamic> toMap() => {
        "mensaje": mensaje,
        "items": List<dynamic>.from(items?.map((x) => x.toMap()) ?? []),
        "pag": pag,
        "pags": pags,
        "sizePage": sizePage,
        "totals": totals,
      };
}

class ItemEvent {
  ItemEvent({
    this.id,
    this.fechahoraEvento,
    this.premioCash,
    this.acumulado,
    this.premioOtros,
    this.moneda,
    this.costo,
    this.isViews = false,
    this.isLike = false,
    this.isComments = false,
    this.isSaved = false,
    this.isShared = false,
    this.isDislikes = false,
    this.vidId,
    this.artista,
    this.canal,
    this.fechaVideo,
    this.videoId,
    this.thumblary,
    this.titulo,
    this.urlVideo,
    this.genero,
    this.proveedor,
  });

  final int? id;
  final DateTime? fechahoraEvento;
  final int? premioCash;
  final int? acumulado;
  final String? premioOtros;
  final String? moneda;
  final int? costo;
  final bool isViews;
  final bool isLike;
  final bool isComments;
  final bool isSaved;
  final bool isShared;
  final bool isDislikes;
  final int? vidId;
  final String? artista;
  final String? canal;
  final DateTime? fechaVideo;
  final String? videoId;
  final String? thumblary;
  final String? titulo;
  final String? urlVideo;
  final String? genero;
  final String? proveedor;

  ItemEvent copyWith({
    int? id,
    DateTime? fechahoraEvento,
    int? premioCash,
    int? acumulado,
    String? premioOtros,
    String? moneda,
    int? costo,
    bool? isViews,
    bool? isLike,
    bool? isComments,
    bool? isSaved,
    bool? isShared,
    bool? isDislikes,
    int? vidId,
    String? artista,
    String? canal,
    DateTime? fechaVideo,
    String? videoId,
    String? thumblary,
    String? titulo,
    String? urlVideo,
    String? genero,
    String? proveedor,
  }) =>
      ItemEvent(
        id: id ?? this.id,
        fechahoraEvento: fechahoraEvento ?? this.fechahoraEvento,
        premioCash: premioCash ?? this.premioCash,
        acumulado: acumulado ?? this.acumulado,
        premioOtros: premioOtros ?? this.premioOtros,
        moneda: moneda ?? this.moneda,
        costo: costo ?? this.costo,
        isViews: isViews ?? this.isViews,
        isLike: isLike ?? this.isLike,
        isComments: isComments ?? this.isComments,
        isSaved: isSaved ?? this.isSaved,
        isShared: isShared ?? this.isShared,
        isDislikes: isDislikes ?? this.isDislikes,
        vidId: vidId ?? this.vidId,
        artista: artista ?? this.artista,
        canal: canal ?? this.canal,
        fechaVideo: fechaVideo ?? this.fechaVideo,
        videoId: videoId ?? this.videoId,
        thumblary: thumblary ?? this.thumblary,
        titulo: titulo ?? this.titulo,
        urlVideo: urlVideo ?? this.urlVideo,
        genero: genero ?? this.genero,
        proveedor: proveedor ?? this.proveedor,
      );

  factory ItemEvent.fromJson(String str) => ItemEvent.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ItemEvent.fromMap(Map<String, dynamic> json) => ItemEvent(
        id: json["id"],
        fechahoraEvento: json["fechahora_evento"] == null
            ? null
            : DateTime.parse(json["fechahora_evento"]).toLocal(),
        premioCash: json["premio_cash"],
        acumulado: json["acumulado"],
        premioOtros: json["premio_otros"],
        moneda: json["moneda"],
        costo: json["costo"] ?? 0,
        isViews: json["is_views"] ?? false,
        isLike: json["is_like"] ?? false,
        isComments: json["is_comments"] ?? false,
        isSaved: json["is_saved"] ?? false,
        isShared: json["is_shared"] ?? false,
        isDislikes: json["is_dislikes"] ?? false,
        vidId: json["vid_id"],
        artista: json["artista"],
        canal: json["canal"],
        fechaVideo: json["fecha_video"] == null
            ? null
            : DateTime.parse(json["fecha_video"]).toLocal(),
        videoId: json["video_id"],
        thumblary: json["thumblary"],
        titulo: json["titulo"],
        urlVideo: json["url_video"],
        genero: json["genero"],
        proveedor: json["proveedor"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "fechahora_evento": fechahoraEvento?.toIso8601String(),
        "premio_cash": premioCash,
        "acumulado": acumulado,
        "premio_otros": premioOtros,
        "moneda": moneda,
        "costo": costo,
        "is_views": isViews,
        "is_like": isLike,
        "is_comments": isComments,
        "is_saved": isSaved,
        "is_shared": isShared,
        "is_dislikes": isDislikes,
        "vid_id": vidId,
        "artista": artista,
        "canal": canal,
        "fecha_video": fechaVideo?.toIso8601String(),
        "video_id": videoId,
        "thumblary": thumblary,
        "titulo": titulo,
        "url_video": urlVideo,
        "genero": genero,
        "proveedor": proveedor,
      };
}
