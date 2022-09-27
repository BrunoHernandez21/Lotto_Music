// To parse this JSON data, do
//
//     final carritoModel = carritoModelFromMap(jsonString);

import 'dart:convert';
import 'package:intl/intl.dart';

class CarritoModel {
  CarritoModel({
    this.id = 0,
    this.activo = true,
    this.cantidad = 1,
    this.totalLinea = 0,
    this.precioUnitario,
    this.descuento,
    this.fechaCarrito,
    this.planId = 0,
    this.usuarioId = 0,
    this.mensaje,
  });

  int id;
  bool activo;
  int cantidad;
  double totalLinea;
  double? precioUnitario;
  double? descuento;
  DateTime? fechaCarrito;
  int planId;
  int usuarioId;
  String? mensaje;

  CarritoModel copyWith({
    int? id,
    bool? activo,
    int? cantidad,
    double? totalLinea,
    double? precioUnitario,
    double? descuento,
    DateTime? fechaCarrito,
    int? planId,
    int? usuarioId,
    String? mensaje,
  }) =>
      CarritoModel(
          id: id ?? this.id,
          activo: activo ?? this.activo,
          cantidad: cantidad ?? this.cantidad,
          totalLinea: totalLinea ?? this.totalLinea,
          precioUnitario: precioUnitario ?? this.precioUnitario,
          descuento: descuento ?? this.descuento,
          fechaCarrito: fechaCarrito ?? this.fechaCarrito,
          planId: planId ?? this.planId,
          usuarioId: usuarioId ?? this.usuarioId,
          mensaje: mensaje ?? this.mensaje);

  factory CarritoModel.fromJson(String str) {
    try {
      return CarritoModel.fromMap(json.decode(str));
    } catch (e) {
      return CarritoModel();
    }
  }

  String toJson() => json.encode(toMap());

  factory CarritoModel.fromMap(Map<String, dynamic> json) => CarritoModel(
        id: json["id"] ?? 0,
        activo: json["activo"] ?? false,
        cantidad: json["cantidad"] ?? 0,
        totalLinea: json["total_linea"]?.toDouble() ?? 0,
        precioUnitario: json["precio_unitario"]?.toDouble() ?? 0,
        descuento: json["descuento"]?.toDouble(),
        fechaCarrito: json["fecha_carrito"] == null
            ? null
            : DateTime.parse(json["fecha_carrito"]),
        planId: json["plan_id"] ?? 0,
        usuarioId: json["usuario_id"] ?? 0,
        mensaje: json["mensaje"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "activo": activo,
        "cantidad": cantidad,
        "total_linea": totalLinea,
        "precio_unitario": precioUnitario,
        "descuento": descuento,
        "fecha_carrito": fechaCarrito == null
            ? null
            : DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(fechaCarrito!),
        "plan_id": planId,
        "usuario_id": usuarioId,
        "mensaje": mensaje,
      };
}
