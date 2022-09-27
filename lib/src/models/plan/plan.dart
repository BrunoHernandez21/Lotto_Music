import 'dart:convert';

class PlanModel {
  PlanModel({
    this.id = 0,
    this.titulo,
    this.descripcion,
    this.prePuntos,
    this.puntos = 0,
    this.precio = 0,
    this.moneda = "MXN",
    this.suscribcion = false,
    this.prePrecio,
  });

  int id;
  String? titulo;
  String? descripcion;
  int? prePuntos;
  int puntos;
  double? prePrecio;
  double precio;
  String moneda;
  bool suscribcion;

  PlanModel copyWith({
    int? id,
    String? titulo,
    String? descripcion,
    int? prePuntos,
    int? puntos,
    double? precio,
    String? moneda,
    bool? suscribcion,
    double? prePrecio,
  }) =>
      PlanModel(
        id: id ?? this.id,
        titulo: titulo ?? this.titulo,
        descripcion: descripcion ?? this.descripcion,
        prePuntos: prePuntos ?? this.prePuntos,
        puntos: puntos ?? this.puntos,
        precio: precio ?? this.precio,
        moneda: moneda ?? this.moneda,
        suscribcion: suscribcion ?? this.suscribcion,
        prePrecio: prePrecio ?? this.prePrecio,
      );

  factory PlanModel.fromJson(String str) {
    try {
      return PlanModel.fromMap(json.decode(str));
    } catch (e) {
      return PlanModel();
    }
  }

  String toJson() => json.encode(toMap());

  factory PlanModel.fromMap(Map<String, dynamic> json) => PlanModel(
        id: json["id"]?.toInt() ?? 0,
        titulo: json["titulo"],
        descripcion: json["descripcion"],
        prePuntos: json["Pre_puntos"]?.toInt() ?? 0,
        puntos: json["puntos"]?.toInt() ?? 0,
        precio: json["precio"]?.toDouble() ?? 0,
        moneda: json["moneda"] ?? "MXN",
        suscribcion: json["suscribcion"] ?? false,
        prePrecio: json["pre_precio"]?.toDouble() ?? 0,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "titulo": titulo,
        "descripcion": descripcion,
        "Pre_puntos": prePuntos,
        "puntos": puntos,
        "precio": precio,
        "moneda": moneda,
        "suscribcion": suscribcion,
        "pre_precio": prePrecio,
      };
}
