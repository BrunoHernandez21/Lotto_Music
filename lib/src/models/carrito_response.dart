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

  factory CarritoResponse.fromJson(String str) =>
      CarritoResponse.fromMap(json.decode(str));

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
    this.totalLinea,
    this.precioUnitario,
    this.descuento,
    this.fechaCarrito,
    this.planId = 0,
    this.cash = 0,
    this.nombre = "",
    this.precio = 0,
    this.moneda,
    this.suscribcion = false,
  });

  int id;
  int cantidad;
  double? totalLinea;
  double? precioUnitario;
  double? descuento;
  DateTime? fechaCarrito;
  int planId;
  int cash;
  String nombre;
  double precio;
  String? moneda;
  bool suscribcion;

  ItemsCarrito copyWith({
    int? id,
    int? cantidad,
    double? totalLinea,
    double? precioUnitario,
    double? descuento,
    DateTime? fechaCarrito,
    int? planId,
    int? cash,
    String? nombre,
    double? precio,
    String? moneda,
    bool? suscribcion,
  }) =>
      ItemsCarrito(
        id: id ?? this.id,
        cantidad: cantidad ?? this.cantidad,
        totalLinea: totalLinea ?? this.totalLinea,
        precioUnitario: precioUnitario ?? this.precioUnitario,
        descuento: descuento ?? this.descuento,
        fechaCarrito: fechaCarrito ?? this.fechaCarrito,
        planId: planId ?? this.planId,
        cash: cash ?? this.cash,
        nombre: nombre ?? this.nombre,
        precio: precio ?? this.precio,
        moneda: moneda ?? this.moneda,
        suscribcion: suscribcion ?? this.suscribcion,
      );

  factory ItemsCarrito.fromJson(String str) =>
      ItemsCarrito.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ItemsCarrito.fromMap(Map<String, dynamic> json) => ItemsCarrito(
        id: json["id"],
        cantidad: json["cantidad"],
        totalLinea: json["total_linea"]?.toDouble(),
        precioUnitario: json["precio_unitario"]?.toDouble(),
        descuento: json["descuento"]?.toDouble(),
        fechaCarrito: DateTime.parse(json["fecha_carrito"]),
        planId: json["plan_id"],
        cash: json["cash"],
        nombre: json["nombre"],
        precio: json["precio"]?.toDouble(),
        moneda: json["moneda"],
        suscribcion: json["suscribcion"] ?? false,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "cantidad": cantidad,
        "total_linea": totalLinea,
        "precio_unitario": precioUnitario,
        "descuento": descuento,
        "fecha_carrito": fechaCarrito == null
            ? null
            : DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(fechaCarrito!),
        "plan_id": planId,
        "cash": cash,
        "nombre": nombre,
        "precio": precio,
        "moneda": moneda,
        "suscribcion": suscribcion,
      };
}
