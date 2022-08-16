// To parse this JSON data, do
//
//     final stadisticsResponse = stadisticsResponseFromMap(jsonString);

import 'dart:convert';

import 'package:lotto_music/src/models/stadistics_model.dart';

class StadisticsResponse {
  StadisticsResponse({
    this.mensaje,
    this.stadisticModel,
  });

  String? mensaje;
  List<StadisticModel>? stadisticModel;

  StadisticsResponse copyWith({
    String? mensaje,
    List<StadisticModel>? stadisticModel,
  }) =>
      StadisticsResponse(
        mensaje: mensaje ?? this.mensaje,
        stadisticModel: stadisticModel ?? this.stadisticModel,
      );

  factory StadisticsResponse.fromJson(String str) =>
      StadisticsResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StadisticsResponse.fromMap(Map<String, dynamic> json) =>
      StadisticsResponse(
        mensaje: json["mensaje"],
        stadisticModel: List<StadisticModel>.from(
            json["items"].map((x) => StadisticModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "mensaje": mensaje,
        "items":
            List<dynamic>.from(stadisticModel?.map((x) => x.toMap()) ?? []),
      };
}
