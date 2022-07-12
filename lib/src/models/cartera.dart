// To parse this JSON data, do
//
//     final carteraModel = carteraModelFromMap(jsonString);

import 'dart:convert';

class CarteraModel {
  CarteraModel({
    this.cartera,
    this.mensaje,
  });

  Cartera? cartera;
  String? mensaje;

  CarteraModel copyWith({
    Cartera? cartera,
    String? mensaje,
  }) =>
      CarteraModel(
        cartera: cartera ?? this.cartera,
        mensaje: mensaje ?? this.mensaje,
      );

  factory CarteraModel.fromJson(String str) =>
      CarteraModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CarteraModel.fromMap(Map<String, dynamic> json) => CarteraModel(
        cartera:
            json["cartera"] == null ? null : Cartera.fromMap(json["cartera"]),
        mensaje: json["mensaje"],
      );

  Map<String, dynamic> toMap() => {
        "cartera": cartera?.toMap(),
        "mensaje": mensaje,
      };
}

class Cartera {
  Cartera({
    required this.id,
    required this.acumuladoAlto8Am,
    required this.acumuladoBajo8Pm,
    required this.aproximacionAlta00Am,
    required this.aproximacionBaja,
    required this.oportunidades,
    required this.idUsuario,
  });

  int id;
  int acumuladoAlto8Am;
  int acumuladoBajo8Pm;
  int aproximacionAlta00Am;
  int aproximacionBaja;
  int oportunidades;
  int idUsuario;

  Cartera copyWith({
    int? id,
    int? acumuladoAlto8Am,
    int? acumuladoBajo8Pm,
    int? aproximacionAlta00Am,
    int? aproximacionBaja,
    int? oportunidades,
    int? idUsuario,
  }) =>
      Cartera(
        id: id ?? this.id,
        acumuladoAlto8Am: acumuladoAlto8Am ?? this.acumuladoAlto8Am,
        acumuladoBajo8Pm: acumuladoBajo8Pm ?? this.acumuladoBajo8Pm,
        aproximacionAlta00Am: aproximacionAlta00Am ?? this.aproximacionAlta00Am,
        aproximacionBaja: aproximacionBaja ?? this.aproximacionBaja,
        oportunidades: oportunidades ?? this.oportunidades,
        idUsuario: idUsuario ?? this.idUsuario,
      );

  factory Cartera.fromJson(String str) => Cartera.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Cartera.fromMap(Map<String, dynamic> json) => Cartera(
        id: json["id"],
        acumuladoAlto8Am: json["acumulado_alto8am"],
        acumuladoBajo8Pm: json["acumulado_bajo8pm"],
        aproximacionAlta00Am: json["aproximacion_alta00am"],
        aproximacionBaja: json["aproximacion_baja"],
        oportunidades: json["oportunidades"],
        idUsuario: json["id_usuario"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "acumulado_alto8am": acumuladoAlto8Am,
        "acumulado_bajo8pm": acumuladoBajo8Pm,
        "aproximacion_alta00am": aproximacionAlta00Am,
        "aproximacion_baja": aproximacionBaja,
        "oportunidades": oportunidades,
        "id_usuario": idUsuario,
      };
}
