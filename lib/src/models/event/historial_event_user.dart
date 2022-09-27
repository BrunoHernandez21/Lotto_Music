// To parse this JSON data, do
//
//     final historialEventoUsuario = historialEventoUsuarioFromMap(jsonString);

import 'dart:convert';

class HistorialEventoUsuario {
  HistorialEventoUsuario({
    this.mensaje,
    this.pag = 0,
    this.pags = 0,
    this.sizePage,
    this.totals,
    this.userEvent,
  });

  String? mensaje;
  int pag;
  int pags;
  int? sizePage;
  int? totals;
  List<HistorialModel>? userEvent;

  HistorialEventoUsuario copyWith({
    String? mensaje,
    int? pag,
    int? pags,
    int? sizePage,
    int? totals,
    List<HistorialModel>? userEvent,
  }) =>
      HistorialEventoUsuario(
        mensaje: mensaje ?? this.mensaje,
        pag: pag ?? this.pag,
        pags: pags ?? this.pags,
        sizePage: sizePage ?? this.sizePage,
        totals: totals ?? this.totals,
        userEvent: userEvent ?? this.userEvent,
      );

  factory HistorialEventoUsuario.fromJson(String str) {
    try {
      return HistorialEventoUsuario.fromMap(json.decode(str));
    } catch (e) {
      return HistorialEventoUsuario(mensaje: "mensaje incomprensible");
    }
  }

  String toJson() => json.encode(toMap());

  factory HistorialEventoUsuario.fromMap(Map<String, dynamic> json) =>
      HistorialEventoUsuario(
        mensaje: json["mensaje"],
        pag: json["pag"] = 0,
        pags: json["pags"] = 0,
        sizePage: json["sizePage"],
        totals: json["totals"],
        userEvent: json["userEvent"] == null
            ? null
            : List<HistorialModel>.from(
                json["userEvent"].map((x) => HistorialModel.fromMap(x))),
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

class HistorialModel {
  HistorialModel({
    this.id = 0,
    this.activo = false,
    this.fecha,
    this.viewsCount,
    this.likeCount,
    this.commentsCount,
    this.dislikesCount,
    this.savedCount,
    this.sharedCount,
    this.usuarioId = 0,
    this.eventoId = 0,
  });

  int id;
  bool activo;
  DateTime? fecha;
  int? viewsCount;
  int? likeCount;
  int? commentsCount;
  int? dislikesCount;
  int? savedCount;
  int? sharedCount;
  int usuarioId;
  int eventoId;

  HistorialModel copyWith({
    int? id,
    bool? activo,
    DateTime? fecha,
    int? viewsCount,
    int? likeCount,
    int? commentsCount,
    int? dislikesCount,
    int? savedCount,
    int? sharedCount,
    int? usuarioId,
    int? eventoId,
  }) =>
      HistorialModel(
        id: id ?? this.id,
        activo: activo ?? this.activo,
        fecha: fecha ?? this.fecha,
        viewsCount: viewsCount ?? this.viewsCount,
        likeCount: likeCount ?? this.likeCount,
        commentsCount: commentsCount ?? this.commentsCount,
        dislikesCount: dislikesCount ?? this.dislikesCount,
        savedCount: savedCount ?? this.savedCount,
        sharedCount: sharedCount ?? this.sharedCount,
        usuarioId: usuarioId ?? this.usuarioId,
        eventoId: eventoId ?? this.eventoId,
      );

  factory HistorialModel.fromJson(String str) =>
      HistorialModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HistorialModel.fromMap(Map<String, dynamic> json) => HistorialModel(
        id: json["id"] ?? 0,
        activo: json["activo"] ?? false,
        fecha: json["fecha"] == null ? null : DateTime.parse(json["fecha"]),
        viewsCount: json["views_count"],
        likeCount: json["like_count"],
        commentsCount: json["comments_count"],
        dislikesCount: json["dislikes_count"],
        savedCount: json["saved_count"],
        sharedCount: json["shared_count"],
        usuarioId: json["usuario_id"] ?? 0,
        eventoId: json["evento_id"] ?? 0,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "activo": activo,
        "fecha": fecha?.toIso8601String(),
        "views_count": viewsCount,
        "like_count": likeCount,
        "comments_count": commentsCount,
        "dislikes_count": dislikesCount,
        "saved_count": savedCount,
        "shared_count": sharedCount,
        "usuario_id": usuarioId,
        "evento_id": eventoId,
      };
}
