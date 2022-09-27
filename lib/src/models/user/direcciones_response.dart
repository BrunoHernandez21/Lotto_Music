// To parse this JSON data, do
//
//     final direccionesResponse = direccionesResponseFromMap(jsonString);

import 'dart:convert';

import 'direcciones.dart';

class DireccionesResponse {
  DireccionesResponse({
    this.mensaje,
    this.direcciones,
  });

  String? mensaje;
  List<DireccionesModel>? direcciones;

  DireccionesResponse copyWith({
    String? mensaje,
    List<DireccionesModel>? direcciones,
  }) =>
      DireccionesResponse(
        mensaje: mensaje ?? this.mensaje,
        direcciones: direcciones ?? this.direcciones,
      );

  factory DireccionesResponse.fromJson(String str) {
    try {
      return DireccionesResponse.fromMap(json.decode(str));
    } catch (e) {
      return DireccionesResponse(mensaje: "mensaje incomprensible");
    }
  }

  String toJson() => json.encode(toMap());

  factory DireccionesResponse.fromMap(Map<String, dynamic> json) =>
      DireccionesResponse(
        mensaje: json["mensaje"],
        direcciones: json["direcciones"] == null
            ? null
            : List<DireccionesModel>.from(
                json["direcciones"].map((x) => DireccionesModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "mensaje": mensaje,
        "direcciones":
            List<dynamic>.from(direcciones?.map((x) => x.toMap()) ?? []),
      };
}
