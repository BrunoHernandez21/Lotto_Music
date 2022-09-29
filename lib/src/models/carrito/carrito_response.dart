// To parse this JSON data, do
//
//     final responseCarrito = responseCarritoFromMap(jsonString);

import 'dart:convert';
import 'package:intl/intl.dart';

class CarritoResponse {
  CarritoResponse({this.itemsCarrito, this.mensaje});

  List<ItemsCarrito>? itemsCarrito;
  String? mensaje;

  CarritoResponse copyWith(
          {List<ItemsCarrito>? itemsCarrito, String? mensaje}) =>
      CarritoResponse(
        itemsCarrito: itemsCarrito ?? this.itemsCarrito,
        mensaje: mensaje ?? this.mensaje,
      );

  factory CarritoResponse.fromJson(String str) {
    try {
      return CarritoResponse.fromMap(json.decode(str));
    } catch (e) {
      return CarritoResponse();
    }
  }

  String toJson() => json.encode(toMap());

  factory CarritoResponse.fromMap(Map<String, dynamic> json) => CarritoResponse(
      itemsCarrito: json["items_carrito"] == null
          ? null
          : List<ItemsCarrito>.from(
              json["items_carrito"].map((x) => ItemsCarrito.fromMap(x))),
      mensaje: json["mensaje"]);

  Map<String, dynamic> toMap() => {
        "items_carrito":
            List<dynamic>.from(itemsCarrito?.map((x) => x.toMap()) ?? []),
        "mensaje": mensaje
      };
}

class ItemsCarrito {
  ItemsCarrito({
    this.id = 0,
    this.cantidad = 0,
    this.totalLinea = 0,
    this.puntosLinea = 0,
    this.fechaCarrito,
    this.planId = 0,
    this.titulo,
    this.descripcion,
    this.moneda,
    this.suscribcion = false,
  });

  int id;
  int cantidad;
  double totalLinea;
  int puntosLinea;
  DateTime? fechaCarrito;
  int planId;
  String? titulo;
  String? descripcion;
  String? moneda;
  bool suscribcion;

  ItemsCarrito copyWith({
    int? id,
    int? cantidad,
    double? totalLinea,
    int? puntosLinea,
    DateTime? fechaCarrito,
    int? planId,
    String? titulo,
    String? descripcion,
    String? moneda,
    bool? suscribcion,
  }) =>
      ItemsCarrito(
        id: id ?? this.id,
        cantidad: cantidad ?? this.cantidad,
        totalLinea: totalLinea ?? this.totalLinea,
        puntosLinea: puntosLinea ?? this.puntosLinea,
        fechaCarrito: fechaCarrito ?? this.fechaCarrito,
        planId: planId ?? this.planId,
        titulo: titulo ?? this.titulo,
        descripcion: descripcion ?? this.descripcion,
        moneda: moneda ?? this.moneda,
        suscribcion: suscribcion ?? this.suscribcion,
      );

  factory ItemsCarrito.fromJson(String str) =>
      ItemsCarrito.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ItemsCarrito.fromMap(Map<String, dynamic> json) => ItemsCarrito(
        id: json["id"]?.toInt() ?? 0,
        cantidad: json["cantidad"]?.toInt() ?? 0,
        totalLinea: json["total_linea"]?.toDouble() ?? 0,
        puntosLinea: json["puntos_linea"]?.toInt() ?? 0,
        fechaCarrito: json["fecha_carrito"] == null
            ? null
            : DateTime.parse(json["fecha_carrito"]).toLocal(),
        planId: json["plan_id"]?.toInt() ?? 0,
        titulo: json["titulo"],
        descripcion: json["descripcion"],
        moneda: json["moneda"] ?? "MXN",
        suscribcion: json["suscribcion"] ?? false,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "cantidad": cantidad,
        "total_linea": totalLinea,
        "puntos_linea": puntosLinea,
        "fecha_carrito": fechaCarrito == null
            ? null
            : DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(fechaCarrito!),
        "plan_id": planId,
        "titulo": titulo,
        "descripcion": descripcion,
        "moneda": moneda,
        "suscribcion": suscribcion,
      };
}
