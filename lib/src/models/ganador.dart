// To parse this JSON data, do
//
//     final ganadorModel = ganadorModelFromMap(jsonString);

import 'dart:convert';

class GanadorModel {
  GanadorModel({
    this.ganador,
    this.pag = 0,
    this.pags = 0,
    this.sizePage = 10,
    this.totals = 0,
    this.mensjae,
  });

  List<Ganador>? ganador;
  int pag;
  int pags;
  int sizePage;
  int totals;
  String? mensjae;

  GanadorModel copyWith({
    List<Ganador>? ganador,
    int? pag,
    int? pags,
    int? sizePage,
    int? totals,
    String? mensjae,
  }) =>
      GanadorModel(
        ganador: ganador ?? this.ganador,
        pag: pag ?? this.pag,
        pags: pags ?? this.pags,
        sizePage: sizePage ?? this.sizePage,
        totals: totals ?? this.totals,
        mensjae: mensjae ?? this.mensjae,
      );

  factory GanadorModel.fromJson(String str) =>
      GanadorModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GanadorModel.fromMap(Map<String, dynamic> json) => GanadorModel(
        ganador:
            List<Ganador>.from(json["ganador"].map((x) => Ganador.fromMap(x))),
        pag: json["pag"],
        pags: json["pags"],
        sizePage: json["sizePage"],
        totals: json["totals"],
        mensjae: json["mensjae"],
      );

  Map<String, dynamic> toMap() => {
        "ganador": List<dynamic>.from(ganador?.map((x) => x.toMap()) ?? []),
        "pag": pag,
        "pags": pags,
        "sizePage": sizePage,
        "totals": totals,
        "mensjae": mensjae,
      };
}

class Ganador {
  Ganador({
    this.id = 0,
    this.cantidad = 0,
    this.concepto = "",
    this.idApuesta = 0,
    this.idGanador = 0,
    this.idUsuario = 0,
  });

  int id;
  int cantidad;
  String concepto;
  int idApuesta;
  int idGanador;
  int idUsuario;

  Ganador copyWith({
    int? id,
    int? cantidad,
    String? concepto,
    int? idApuesta,
    int? idGanador,
    int? idUsuario,
  }) =>
      Ganador(
        id: id ?? this.id,
        cantidad: cantidad ?? this.cantidad,
        concepto: concepto ?? this.concepto,
        idApuesta: idApuesta ?? this.idApuesta,
        idGanador: idGanador ?? this.idGanador,
        idUsuario: idUsuario ?? this.idUsuario,
      );

  factory Ganador.fromJson(String str) => Ganador.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Ganador.fromMap(Map<String, dynamic> json) => Ganador(
        id: json["id"],
        cantidad: json["cantidad"],
        concepto: json["concepto"],
        idApuesta: json["id_apuesta"],
        idGanador: json["id_ganador"],
        idUsuario: json["id_usuario"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "cantidad": cantidad,
        "concepto": concepto,
        "id_apuesta": idApuesta,
        "id_ganador": idGanador,
        "id_usuario": idUsuario,
      };
}
