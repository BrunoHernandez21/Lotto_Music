import 'dart:convert';

class PlanModel {
  PlanModel({
    this.id = 0,
    this.activo = true,
    this.cash = 0,
    this.nombre = "",
    this.precio = 0,
    this.moneda = "MXN",
    this.suscribcion = false,
  });

  int id;
  bool activo;
  int cash;
  String nombre;
  double precio;
  String moneda;
  bool suscribcion;

  PlanModel copyWith({
    int? id,
    bool? activo,
    int? cash,
    String? nombre,
    double? precio,
    String? moneda,
    bool? suscribcion,
  }) =>
      PlanModel(
        id: id ?? this.id,
        activo: activo ?? this.activo,
        cash: cash ?? this.cash,
        nombre: nombre ?? this.nombre,
        precio: precio ?? this.precio,
        moneda: moneda ?? this.moneda,
        suscribcion: suscribcion ?? this.suscribcion,
      );

  factory PlanModel.fromJson(String str) => PlanModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PlanModel.fromMap(Map<String, dynamic> json) => PlanModel(
        id: json["id"] ?? 0,
        activo: json["activo"] ?? true,
        cash: json["cash"] ?? 0,
        nombre: json["nombre"] ?? "",
        precio: json["precio"] == null ? 0.0 : json["precio"].toDouble(),
        moneda: json["moneda"] ?? "MXN",
        suscribcion: json["suscribcion"] ?? false,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "activo": activo,
        "cash": cash,
        "nombre": nombre,
        "precio": precio,
        "moneda": moneda,
        "suscribcion": suscribcion,
      };
}
