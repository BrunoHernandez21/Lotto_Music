// To parse this JSON data, do
//
//     final videoEventModel = videoEventModelFromMap(jsonString);

import 'dart:convert';

import 'package:lotto_music/src/models/evento.dart';
import 'package:lotto_music/src/models/videos.dart';

class VideoEventModel {
  VideoEventModel(
      {this.items,
      required this.pag,
      required this.pags,
      required this.sizePage,
      required this.totals,
      this.mensaje});

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
        mensaje: mensaje ?? this.mensaje,
        pags: pags ?? this.pags,
        sizePage: sizePage ?? this.sizePage,
        totals: totals ?? this.totals,
      );

  factory VideoEventModel.fromJson(String str) =>
      VideoEventModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VideoEventModel.fromMap(Map<String, dynamic> json) => VideoEventModel(
        items: List<ItemEvent>.from(
            json["items"].map((x) => ItemEvent.fromMap(x))),
        pag: json["pag"],
        mensaje: json["mensaje"],
        pags: json["pags"],
        sizePage: json["sizePage"],
        totals: json["totals"],
      );

  Map<String, dynamic> toMap() => {
        "items": List<dynamic>.from(items?.map((x) => x.toMap()) ?? []),
        "pag": pag,
        "mensaje": mensaje,
        "pags": pags,
        "sizePage": sizePage,
        "totals": totals,
      };
}

class ItemEvent {
  ItemEvent({
    required this.evento,
    required this.video,
  });

  EventoModel evento;
  VideoModel video;

  ItemEvent copyWith({
    EventoModel? evento,
    VideoModel? video,
  }) =>
      ItemEvent(
        evento: evento ?? this.evento,
        video: video ?? this.video,
      );

  factory ItemEvent.fromJson(String str) => ItemEvent.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ItemEvent.fromMap(Map<String, dynamic> json) => ItemEvent(
        evento: EventoModel.fromMap(json["evento"]),
        video: VideoModel.fromMap(json["video"]),
      );

  Map<String, dynamic> toMap() => {
        "evento": evento.toMap(),
        "video": video.toMap(),
      };
}
