// To parse this JSON data, do
//
//     final userEventModel = userEventModelFromMap(jsonString);

import 'dart:convert';

class UserEventModel {
  UserEventModel({
    this.id = 0,
    this.activo,
    this.fecha,
    this.viewsCount,
    this.likeCount,
    this.commentsCount,
    this.dislikesCount,
    this.savedCount,
    this.sharedCount,
    this.usuarioId = 0,
    this.eventoId = 0,
    this.mensaje,
  });

  int id;
  bool? activo;
  DateTime? fecha;
  int? viewsCount;
  int? likeCount;
  int? commentsCount;
  int? dislikesCount;
  int? savedCount;
  int? sharedCount;
  int usuarioId;
  int eventoId;
  String? mensaje;

  UserEventModel copyWith({
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
    String? mensaje,
  }) =>
      UserEventModel(
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
        mensaje: mensaje ?? this.mensaje,
      );

  factory UserEventModel.fromJson(String str) {
    try {
      return UserEventModel.fromMap(json.decode(str));
    } catch (e) {
      return UserEventModel(mensaje: "mensaje incomprensible");
    }
  }

  String toJson() => json.encode(toMap());

  factory UserEventModel.fromMap(Map<String, dynamic> json) => UserEventModel(
        id: json["id"] ?? 0,
        activo: json["activo"],
        fecha: json["fecha"] == null
            ? null
            : DateTime.parse(json["fecha"]).toLocal(),
        viewsCount: json["views_count"],
        likeCount: json["like_count"],
        commentsCount: json["comments_count"],
        dislikesCount: json["dislikes_count"],
        savedCount: json["saved_count"],
        sharedCount: json["shared_count"],
        usuarioId: json["usuario_id"] ?? 0,
        eventoId: json["evento_id"] ?? 0,
        mensaje: json["mensaje"],
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
        "mensaje": mensaje,
      };
}
