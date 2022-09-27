// To parse this JSON data, do
//
//     final stadisticsResponse = stadisticsResponseFromJson(jsonString);

import 'dart:convert';

class StadisticModel {
  StadisticModel({
    this.id = 0,
    this.videoId = 0,
    this.fecha,
    this.likeCount,
    this.viewCount,
    this.commentsCount,
    this.dislikesCount,
    this.savedCount,
    this.sharedCount,
  });

  int id;
  int videoId;
  DateTime? fecha;
  int? likeCount;
  int? viewCount;
  int? commentsCount;
  int? dislikesCount;
  int? savedCount;
  int? sharedCount;

  StadisticModel copyWith({
    int? id,
    int? videoId,
    DateTime? fecha,
    int? likeCount,
    int? viewCount,
    int? commentsCount,
    int? dislikesCount,
    int? savedCount,
    int? sharedCount,
  }) =>
      StadisticModel(
        id: id ?? this.id,
        videoId: videoId ?? this.videoId,
        fecha: fecha ?? this.fecha,
        likeCount: likeCount ?? this.likeCount,
        viewCount: viewCount ?? this.viewCount,
        commentsCount: commentsCount ?? this.commentsCount,
        dislikesCount: dislikesCount ?? this.dislikesCount,
        savedCount: savedCount ?? this.savedCount,
        sharedCount: sharedCount ?? this.sharedCount,
      );

  factory StadisticModel.fromJson(String str) {
    try {
      return StadisticModel.fromMap(json.decode(str));
    } catch (e) {
      return StadisticModel();
    }
  }

  String toJson() => json.encode(toMap());

  factory StadisticModel.fromMap(Map<String, dynamic> json) => StadisticModel(
        id: json["id"] ?? 0,
        videoId: json["video_id"],
        fecha: DateTime.parse(json["fecha"]),
        likeCount: json["like_count"],
        viewCount: json["views_count"],
        commentsCount: json["comments_count"],
        dislikesCount: json["dislikes_count"],
        savedCount: json["saved_count"],
        sharedCount: json["shared_count"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "video_id": videoId,
        "fecha": fecha?.toIso8601String(),
        "like_count": likeCount,
        "views_count": viewCount,
        "comments_count": commentsCount,
        "dislikes_count": dislikesCount,
        "saved_count": savedCount,
        "shared_count": sharedCount,
      };
}
