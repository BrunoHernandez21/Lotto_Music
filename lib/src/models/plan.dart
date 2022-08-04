import 'dart:convert';

class PlanModel {
  PlanModel({
    this.id = 0,
    this.activo = true,
    this.puntos = 0,
    this.nombre = "",
    this.precio = 0,
    this.moneda = "MXN",
    this.descuentoItem,
    this.impuesto,
    this.precioTotal = 0,
    this.duracionDias = 365,
    this.suscribcion = false,
  });

  int id;
  bool activo;
  int puntos;
  String nombre;
  double precio;
  String moneda;
  double? descuentoItem;
  double? impuesto;
  double precioTotal;
  int duracionDias;
  bool suscribcion;

  PlanModel copyWith({
    int? id,
    bool? activo,
    int? puntos,
    String? nombre,
    double? precio,
    String? moneda,
    double? descuentoItem,
    double? impuesto,
    double? precioTotal,
    int? duracionDias,
    bool? suscribcion,
  }) =>
      PlanModel(
        id: id ?? this.id,
        activo: activo ?? this.activo,
        puntos: puntos ?? this.puntos,
        nombre: nombre ?? this.nombre,
        precio: precio ?? this.precio,
        moneda: moneda ?? this.moneda,
        descuentoItem: descuentoItem ?? this.descuentoItem,
        impuesto: impuesto ?? this.impuesto,
        precioTotal: precioTotal ?? this.precioTotal,
        duracionDias: duracionDias ?? this.duracionDias,
        suscribcion: suscribcion ?? this.suscribcion,
      );

  factory PlanModel.fromJson(String str) => PlanModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PlanModel.fromMap(Map<String, dynamic> json) => PlanModel(
        id: json["id"] ?? 0,
        activo: json["activo"] ?? false,
        puntos: json["puntos"] ?? 0,
        nombre: json["nombre"] ?? "",
        precio: json["precio"] == null ? 0.0 : json["precio"].toDouble(),
        moneda: json["moneda"] ?? "MXN",
        descuentoItem: json["descuento_item"]?.toDouble(),
        impuesto: json["impuesto"]?.toDouble(),
        precioTotal: json["precio_total"] == null
            ? 0.0
            : json["precio_total"].toDouble(),
        duracionDias: json["duracion_dias"] = 0,
        suscribcion: json["suscribcion"] = false,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "activo": activo,
        "puntos": puntos,
        "nombre": nombre,
        "precio": precio,
        "moneda": moneda,
        "descuento_item": descuentoItem,
        "impuesto": impuesto,
        "precio_total": precioTotal,
        "duracion_dias": duracionDias,
        "suscribcion": suscribcion,
      };
}
