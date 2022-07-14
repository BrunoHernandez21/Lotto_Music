import 'dart:convert';

class PlanModel {
  PlanModel({
    this.id = 0,
    this.activo = true,
    this.acumuladoAlto8Am = 0,
    this.acumuladoBajo8Pm = 0,
    this.aproximacionAlta00Am = 0,
    this.aproximacionBaja = 0,
    this.nombre = "",
    this.oportunidades = 0,
    this.precio = 0,
  });

  int id;
  bool activo;
  int acumuladoAlto8Am;
  int acumuladoBajo8Pm;
  int aproximacionAlta00Am;
  int aproximacionBaja;
  String nombre;
  int oportunidades;
  int precio;

  PlanModel copyWith({
    int? id,
    bool? activo,
    int? acumuladoAlto8Am,
    int? acumuladoBajo8Pm,
    int? aproximacionAlta00Am,
    int? aproximacionBaja,
    String? nombre,
    int? oportunidades,
    int? precio,
  }) =>
      PlanModel(
        id: id ?? this.id,
        activo: activo ?? this.activo,
        acumuladoAlto8Am: acumuladoAlto8Am ?? this.acumuladoAlto8Am,
        acumuladoBajo8Pm: acumuladoBajo8Pm ?? this.acumuladoBajo8Pm,
        aproximacionAlta00Am: aproximacionAlta00Am ?? this.aproximacionAlta00Am,
        aproximacionBaja: aproximacionBaja ?? this.aproximacionBaja,
        nombre: nombre ?? this.nombre,
        oportunidades: oportunidades ?? this.oportunidades,
        precio: precio ?? this.precio,
      );

  factory PlanModel.fromJson(String str) => PlanModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PlanModel.fromMap(Map<String, dynamic> json) => PlanModel(
        id: json["id"],
        activo: json["activo"],
        acumuladoAlto8Am: json["acumulado_alto8am"],
        acumuladoBajo8Pm: json["acumulado_bajo8pm"],
        aproximacionAlta00Am: json["aproximacion_alta00am"],
        aproximacionBaja: json["aproximacion_baja"],
        nombre: json["nombre"],
        oportunidades: json["oportunidades"],
        precio: json["precio"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "activo": activo,
        "acumulado_alto8am": acumuladoAlto8Am,
        "acumulado_bajo8pm": acumuladoBajo8Pm,
        "aproximacion_alta00am": aproximacionAlta00Am,
        "aproximacion_baja": aproximacionBaja,
        "nombre": nombre,
        "oportunidades": oportunidades,
        "precio": precio,
      };
}
