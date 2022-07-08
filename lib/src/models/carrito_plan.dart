// To parse this JSON data, do
//
//     final carritoResponse = carritoResponseFromMap(jsonString);

import 'dart:convert';

import 'package:lotto_music/src/models/carrito.dart';
import 'package:lotto_music/src/models/plan.dart';

class CarritoResponse {
  CarritoResponse({
    this.mensaje,
    this.ordenes,
  });

  String? mensaje;
  List<Ordenes>? ordenes;

  CarritoResponse copyWith({
    String? mensaje,
    List<Ordenes>? ordenes,
  }) =>
      CarritoResponse(
        mensaje: mensaje ?? this.mensaje,
        ordenes: ordenes ?? this.ordenes,
      );

  factory CarritoResponse.fromJson(String str) =>
      CarritoResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CarritoResponse.fromMap(Map<String, dynamic> json) => CarritoResponse(
        mensaje: json["mensaje"],
        ordenes:
            List<Ordenes>.from(json["Ordenes"].map((x) => Ordenes.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "mensaje": mensaje,
        "Ordenes": List<dynamic>.from(ordenes?.map((x) => x.toMap()) ?? []),
      };
}

class Ordenes {
  Ordenes({
    required this.orden,
    required this.plane,
  });

  CarritoModel orden;
  PlanModel plane;

  Ordenes copyWith({
    CarritoModel? orden,
    PlanModel? plane,
  }) =>
      Ordenes(
        orden: orden ?? this.orden,
        plane: plane ?? this.plane,
      );

  factory Ordenes.fromJson(String str) => Ordenes.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Ordenes.fromMap(Map<String, dynamic> json) => Ordenes(
        orden: CarritoModel.fromMap(json["orden"]),
        plane: PlanModel.fromMap(json["plane"]),
      );

  Map<String, dynamic> toMap() => {
        "orden": orden.toMap(),
        "plane": plane.toMap(),
      };
}
