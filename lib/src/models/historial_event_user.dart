// To parse this JSON data, do
//
//     final historialEventosUsuario = historialEventosUsuarioFromMap(jsonString);

import 'dart:convert';

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
        pag: json["pag"],
        pags: json["pags"],
        sizePage: json["sizePage"],
        totals: json["totals"],
        userEvent: List<UserEventModel>.from(
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

class UserEventModel {
  UserEventModel({
    this.id = 0,
    this.activo = true,
    this.cantidad = 0,
    this.comentarios = 0,
    this.likes = 0,
    this.vistas = 0,
    this.dislikes = 0,
    this.usuarioId = 0,
    this.apuestaId = 0,
  });

  int id;
  bool activo;
  int cantidad;
  int comentarios;
  int likes;
  int vistas;
  int dislikes;
  int usuarioId;
  int apuestaId;

  UserEventModel copyWith({
    int? id,
    bool? activo,
    int? cantidad,
    int? comentarios,
    int? likes,
    int? vistas,
    int? dislikes,
    int? usuarioId,
    int? apuestaId,
  }) =>
      UserEventModel(
        id: id ?? this.id,
        activo: activo ?? this.activo,
        cantidad: cantidad ?? this.cantidad,
        comentarios: comentarios ?? this.comentarios,
        likes: likes ?? this.likes,
        vistas: vistas ?? this.vistas,
        dislikes: dislikes ?? this.dislikes,
        usuarioId: usuarioId ?? this.usuarioId,
        apuestaId: apuestaId ?? this.apuestaId,
      );

  factory UserEventModel.fromJson(String str) =>
      UserEventModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserEventModel.fromMap(Map<String, dynamic> json) => UserEventModel(
        id: json["id"],
        activo: json["activo"],
        cantidad: json["cantidad"],
        comentarios: json["comentarios"],
        likes: json["likes"],
        vistas: json["vistas"],
        dislikes: json["dislikes"],
        usuarioId: json["usuario_id"],
        apuestaId: json["apuesta_id"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "activo": activo,
        "cantidad": cantidad,
        "comentarios": comentarios,
        "likes": likes,
        "vistas": vistas,
        "dislikes": dislikes,
        "usuario_id": usuarioId,
        "apuesta_id": apuestaId,
      };
}
