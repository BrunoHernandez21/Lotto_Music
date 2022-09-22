import 'dart:convert';

class DireccionesModel {
  DireccionesModel({
    this.id = 0,
    this.usuarioId = 0,
    this.tipo,
    this.pais,
    this.ciudad,
    this.calle,
    this.cp,
    this.numero,
    this.mensaje,
  });

  int id;
  int usuarioId;
  String? tipo;
  String? pais;
  String? ciudad;
  String? calle;
  String? cp;
  String? numero;
  String? mensaje;

  DireccionesModel copyWith({
    int? id,
    int? usuarioId,
    String? tipo,
    String? pais,
    String? ciudad,
    String? calle,
    String? cp,
    String? numero,
    String? mensaje,
  }) =>
      DireccionesModel(
        id: id ?? this.id,
        usuarioId: usuarioId ?? this.usuarioId,
        tipo: tipo ?? this.tipo,
        pais: pais ?? this.pais,
        ciudad: ciudad ?? this.ciudad,
        calle: calle ?? this.calle,
        cp: cp ?? this.cp,
        numero: numero ?? this.numero,
        mensaje: mensaje ?? this.mensaje,
      );

  factory DireccionesModel.fromJson(String str) =>
      DireccionesModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DireccionesModel.fromMap(Map<String, dynamic> json) =>
      DireccionesModel(
        id: json["id"] ?? 0,
        usuarioId: json["usuario_id"] ?? 0,
        tipo: json["tipo"],
        pais: json["pais"],
        ciudad: json["ciudad"],
        calle: json["calle"],
        cp: json["cp"],
        numero: json["numero"],
        mensaje: json["mensaje"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "usuario_id": usuarioId,
        "tipo": tipo,
        "pais": pais,
        "ciudad": ciudad,
        "calle": calle,
        "cp": cp,
        "numero": numero,
        "mensaje": mensaje,
      };
}
