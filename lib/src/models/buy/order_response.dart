// To parse this JSON data, do
//
//     final ordenResponse = ordenResponseFromMap(jsonString);

import 'dart:convert';

class OrdenResponse {
  OrdenResponse({
    this.mensaje,
    required this.itemsOrden,
    this.orden,
  });

  final String? mensaje;
  final List<ItemsOrden> itemsOrden;
  final Orden? orden;

  OrdenResponse copyWith({
    String? mensaje,
    List<ItemsOrden>? itemsOrden,
    Orden? orden,
  }) =>
      OrdenResponse(
        mensaje: mensaje ?? this.mensaje,
        itemsOrden: itemsOrden ?? this.itemsOrden,
        orden: orden ?? this.orden,
      );

  factory OrdenResponse.fromJson(String str) =>
      OrdenResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrdenResponse.fromMap(Map<String, dynamic> json) => OrdenResponse(
        mensaje: json["mensaje"],
        itemsOrden: json["items_orden"] == null
            ? []
            : List<ItemsOrden>.from(
                json["items_orden"].map((x) => ItemsOrden.fromMap(x))),
        orden: json["orden"] == null ? Orden() : Orden.fromMap(json["orden"]),
      );

  Map<String, dynamic> toMap() => {
        "mensaje": mensaje,
        "items_orden": List<dynamic>.from(itemsOrden.map((x) => x.toMap())),
        "orden": orden?.toMap(),
      };
}

class ItemsOrden {
  ItemsOrden({
    this.cantidad = 0,
    this.totalLinea = 0,
    this.puntosLinea = 0,
    this.ordenId = 0,
    this.planId = 0,
    this.moneda = "MXN",
    this.titulo,
  });

  final int cantidad;
  final int totalLinea;
  final int puntosLinea;
  final int ordenId;
  final int planId;
  final String moneda;
  final String? titulo;

  ItemsOrden copyWith({
    int? cantidad,
    int? totalLinea,
    int? puntosLinea,
    int? ordenId,
    int? planId,
    String? moneda,
    String? titulo,
  }) =>
      ItemsOrden(
        cantidad: cantidad ?? this.cantidad,
        totalLinea: totalLinea ?? this.totalLinea,
        puntosLinea: puntosLinea ?? this.puntosLinea,
        ordenId: ordenId ?? this.ordenId,
        planId: planId ?? this.planId,
        moneda: moneda ?? this.moneda,
        titulo: titulo ?? this.titulo,
      );

  factory ItemsOrden.fromJson(String str) =>
      ItemsOrden.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ItemsOrden.fromMap(Map<String, dynamic> json) => ItemsOrden(
        cantidad: json["cantidad"] ?? 0,
        totalLinea: json["total_linea"] ?? 0,
        puntosLinea: json["puntos_linea"] ?? 0,
        ordenId: json["orden_id"] ?? 0,
        planId: json["plan_id"] ?? 0,
        moneda: json["moneda"] ?? "MXN",
        titulo: json["titulo"],
      );

  Map<String, dynamic> toMap() => {
        "cantidad": cantidad,
        "total_linea": totalLinea,
        "puntos_linea": puntosLinea,
        "orden_id": ordenId,
        "plan_id": planId,
        "moneda": moneda,
        "titulo": titulo,
      };
}

class Orden {
  Orden({
    this.id = 0,
    this.status = "Proceso",
    this.fechaEmitido,
    this.precioTotal = 0,
    this.puntosTotal = 0,
    this.usuarioId = 0,
    this.isSuscription = false,
    this.moneda = "",
  });

  final int id;
  final String status;
  final DateTime? fechaEmitido;
  final double precioTotal;
  final int puntosTotal;
  final int usuarioId;
  final bool isSuscription;
  final String moneda;

  Orden copyWith({
    int? id,
    String? status,
    DateTime? fechaEmitido,
    double? precioTotal,
    int? puntosTotal,
    int? usuarioId,
    bool? isSuscription,
    String? moneda,
  }) =>
      Orden(
        id: id ?? this.id,
        status: status ?? this.status,
        fechaEmitido: fechaEmitido ?? this.fechaEmitido,
        precioTotal: precioTotal ?? this.precioTotal,
        puntosTotal: puntosTotal ?? this.puntosTotal,
        usuarioId: usuarioId ?? this.usuarioId,
        isSuscription: isSuscription ?? this.isSuscription,
        moneda: moneda ?? this.moneda,
      );

  factory Orden.fromJson(String str) => Orden.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Orden.fromMap(Map<String, dynamic> json) => Orden(
        id: json["id"] ?? 0,
        status: json["status"] ?? "",
        fechaEmitido: json["fecha_emitido"] == null
            ? null
            : DateTime.parse(json["fecha_emitido"]),
        precioTotal: (json["precio_total"] ?? 0).toDouble(),
        puntosTotal: json["puntos_total"] ?? 0,
        usuarioId: json["usuario_id"] ?? 0,
        isSuscription: json["is_suscription"] ?? false,
        moneda: json["moneda"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "status": status,
        "fecha_emitido": fechaEmitido?.toIso8601String(),
        "precio_total": precioTotal,
        "puntos_total": puntosTotal,
        "usuario_id": usuarioId,
        "is_suscription": isSuscription,
        "moneda": moneda,
      };
}
