// To parse this JSON data, do
//
//     final tarjetasResponse = tarjetasResponseFromMap(jsonString);

import 'dart:convert';

import 'package:lotto_music/src/models/user/tarjetas.dart';

class TarjetasResponse {
  TarjetasResponse({
    this.mensaje,
    this.tarjetas,
  });

  String? mensaje;
  List<TarjetaModel>? tarjetas;

  TarjetasResponse copyWith({
    String? mensaje,
    List<TarjetaModel>? tarjetas,
  }) =>
      TarjetasResponse(
        mensaje: mensaje ?? this.mensaje,
        tarjetas: tarjetas ?? this.tarjetas,
      );

  factory TarjetasResponse.fromJson(String str) {
    try {
      return TarjetasResponse.fromMap(json.decode(str));
    } catch (e) {
      return TarjetasResponse(mensaje: "mensaje incomprensible");
    }
  }

  String toJson() => json.encode(toMap());

  factory TarjetasResponse.fromMap(Map<String, dynamic> json) =>
      TarjetasResponse(
        mensaje: json["mensaje"],
        tarjetas: json["tarjetas"] == null
            ? null
            : List<TarjetaModel>.from(
                json["tarjetas"].map((x) => TarjetaModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "mensaje": mensaje,
        "tarjetas": List<dynamic>.from(tarjetas?.map((x) => x.toMap()) ?? []),
      };
}
