// To parse this JSON data, do
//
//     final historialEventosUsuario = historialEventosUsuarioFromMap(jsonString);

import 'dart:convert';

import 'package:lotto_music/src/models/usuario_evento.dart';

class HistorialEventosUsuario {
  HistorialEventosUsuario({
    this.mensaje,
    this.pag = 0,
    this.pags = 0,
    this.sizePage = 0,
    this.totals = 0,
    this.userEvent,
  });

  String? mensaje;
  int pag;
  int pags;
  int sizePage;
  int totals;
  List<UserEventModel>? userEvent;

  HistorialEventosUsuario copyWith({
    String? mensaje,
    int? pag,
    int? pags,
    int? sizePage,
    int? totals,
    List<UserEventModel>? userEvent,
  }) =>
      HistorialEventosUsuario(
        mensaje: mensaje ?? this.mensaje,
        pag: pag ?? this.pag,
        pags: pags ?? this.pags,
        sizePage: sizePage ?? this.sizePage,
        totals: totals ?? this.totals,
        userEvent: userEvent ?? this.userEvent,
      );

  factory HistorialEventosUsuario.fromJson(String str) =>
      HistorialEventosUsuario.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HistorialEventosUsuario.fromMap(Map<String, dynamic> json) =>
      HistorialEventosUsuario(
        mensaje: json["mensaje"],
        pag: json["pag"] ?? 0,
        pags: json["pags"] ?? 0,
        sizePage: json["sizePage"] ?? 0,
        totals: json["totals"] ?? 0,
        userEvent: json["userEvent"] == null
            ? null
            : List<UserEventModel>.from(
                json["userEvent"].map((x) => UserEventModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "mensaje": mensaje,
        "pag": pag,
        "pags": pags,
        "sizePage": sizePage,
        "totals": totals,
        "userEvent": List<dynamic>.from(userEvent?.map((x) => x.toMap()) ?? []),
      };
}
