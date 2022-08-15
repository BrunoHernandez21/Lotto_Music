// To parse this JSON data, do
//
//     final videoEventModel = videoEventModelFromMap(jsonString);

import 'dart:convert';

import 'package:lotto_music/generated/intl/messages_es.dart';
import 'package:intl/intl.dart';

class VideoEventModel {
  VideoEventModel({
    this.items,
    this.pag = 0,
    this.pags = 0,
    this.sizePage = 10,
    this.totals = 0,
    this.mensaje,
  });

  List<ItemEvent>? items;
  int pag;
  int pags;
  int sizePage;
  int totals;
  String? mensaje;

  VideoEventModel copyWith({
    List<ItemEvent>? items,
    int? pag,
    int? pags,
    int? sizePage,
    int? totals,
    String? mensaje,
  }) =>
      VideoEventModel(
        items: items ?? this.items,
        pag: pag ?? this.pag,
        pags: pags ?? this.pags,
        sizePage: sizePage ?? this.sizePage,
        totals: totals ?? this.totals,
        mensaje: mensaje ?? this.mensaje,
      );

  factory VideoEventModel.fromJson(String str) =>
      VideoEventModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VideoEventModel.fromMap(Map<String, dynamic> json) => VideoEventModel(
        items: List<ItemEvent>.from(
            json["items"].map((x) => ItemEvent.fromMap(x))),
        pag: json["pag"] ?? 0,
        pags: json["pags"] ?? 0,
        sizePage: json["sizePage"] ?? 10,
        totals: json["totals"] ?? 0,
        mensaje: json["mensaje"],
      );

  Map<String, dynamic> toMap() => {
        "items": List<dynamic>.from(items?.map((x) => x.toMap()) ?? []),
        "pag": pag,
        "pags": pags,
        "sizePage": sizePage,
        "totals": totals,
        "mensaje": messages,
      };
}

class ItemEvent {
  ItemEvent({
    this.id,
    this.fechahoraevento,
    this.premioCash,
    this.acumulado,
    this.premioOtros,
    this.moneda,
    this.categoriaEventoId,
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

  int? id;
  DateTime? fechahoraevento;
  int? premioCash;
  int? acumulado;
  String? premioOtros;
  String? moneda;
  int? categoriaEventoId;
  String? artista;
  String? canal;
  DateTime? fechaVideo;
  String? videoId;
  String? thumblary;
  String? titulo;
  String? urlVideo;
  String? genero;
  String? proveedor;

  ItemEvent copyWith({
    int? id,
    DateTime? fechahoraevento,
    int? premioCash,
    int? acumulado,
    String? premioOtros,
    String? moneda,
    int? categoriaEventoId,
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
        fechahoraevento: fechahoraevento ?? this.fechahoraevento,
        premioCash: premioCash ?? this.premioCash,
        acumulado: acumulado ?? this.acumulado,
        premioOtros: premioOtros ?? this.premioOtros,
        moneda: moneda ?? this.moneda,
        categoriaEventoId: categoriaEventoId ?? this.categoriaEventoId,
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
        fechahoraevento: DateTime.parse(json["fechahora_evento"]),
        premioCash: json["premio_cash"],
        acumulado: json["acumulado"],
        premioOtros: json["premio_otros"],
        moneda: json["moneda"],
        categoriaEventoId: json["categoria_evento_id"],
        artista: json["artista"],
        canal: json["canal"],
        fechaVideo: DateTime.parse(json["fecha_video"]),
        videoId: json["video_id"],
        thumblary: json["thumblary"],
        titulo: json["titulo"],
        urlVideo: json["url_video"],
        genero: json["genero"],
        proveedor: json["proveedor"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "fechahora_evento": fechahoraevento == null
            ? null
            : DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
                .format(fechahoraevento!),
        "premio_cash": premioCash,
        "acumulado": acumulado,
        "premio_otros": premioOtros,
        "moneda": moneda,
        "categoria_evento_id": categoriaEventoId,
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
