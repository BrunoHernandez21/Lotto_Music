// To parse this JSON data, do
//
//     final apuestaModel = apuestaModelFromMap(jsonString);

import 'dart:convert';

class ApuestaModel {
  ApuestaModel({
    this.id = 0,
    this.acumuladoAlto8Am = 0,
    this.acumuladoBajo8Pm = 0,
    this.aproximacionAlta00Am = 0,
    this.aproximacionBaja = 0,
    this.iportunidades = 0,
    this.idUsuario = 0,
  });

  int id;
  int acumuladoAlto8Am;
  int acumuladoBajo8Pm;
  int aproximacionAlta00Am;
  int aproximacionBaja;
  int iportunidades;
  int idUsuario;

  ApuestaModel copyWith({
    int? id,
    int? acumuladoAlto8Am,
    int? acumuladoBajo8Pm,
    int? aproximacionAlta00Am,
    int? aproximacionBaja,
    int? iportunidades,
    int? idUsuario,
  }) =>
      ApuestaModel(
        id: id ?? this.id,
        acumuladoAlto8Am: acumuladoAlto8Am ?? this.acumuladoAlto8Am,
        acumuladoBajo8Pm: acumuladoBajo8Pm ?? this.acumuladoBajo8Pm,
        aproximacionAlta00Am: aproximacionAlta00Am ?? this.aproximacionAlta00Am,
        aproximacionBaja: aproximacionBaja ?? this.aproximacionBaja,
        iportunidades: iportunidades ?? this.iportunidades,
        idUsuario: idUsuario ?? this.idUsuario,
      );

  factory ApuestaModel.fromJson(String str) =>
      ApuestaModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ApuestaModel.fromMap(Map<String, dynamic> json) => ApuestaModel(
        id: json["id"],
        acumuladoAlto8Am: json["acumulado_alto8am"],
        acumuladoBajo8Pm: json["acumulado_bajo8pm"],
        aproximacionAlta00Am: json["aproximacion_alta00am"],
        aproximacionBaja: json["aproximacion_baja"],
        iportunidades: json["iportunidades"],
        idUsuario: json["id_usuario"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "acumulado_alto8am": acumuladoAlto8Am,
        "acumulado_bajo8pm": acumuladoBajo8Pm,
        "aproximacion_alta00am": aproximacionAlta00Am,
        "aproximacion_baja": aproximacionBaja,
        "iportunidades": iportunidades,
        "id_usuario": idUsuario,
      };
}
