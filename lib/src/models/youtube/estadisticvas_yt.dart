// To parse this JSON data, do
//
//     final estadisticasYt = estadisticasYtFromMap(jsonString);

import 'dart:convert';

class EstadisticasYt {
  EstadisticasYt({
    this.kind,
    this.etag,
    this.items,
    this.pageInfo,
  });

  String? kind;
  String? etag;
  List<Item>? items;
  PageInfo? pageInfo;

  EstadisticasYt copyWith({
    String? kind,
    String? etag,
    List<Item>? items,
    PageInfo? pageInfo,
  }) =>
      EstadisticasYt(
        kind: kind ?? this.kind,
        etag: etag ?? this.etag,
        items: items ?? this.items,
        pageInfo: pageInfo ?? this.pageInfo,
      );

  factory EstadisticasYt.fromJson(String str) {
    try {
      return EstadisticasYt.fromMap(json.decode(str));
    } catch (e) {
      return EstadisticasYt();
    }
  }

  String toJson() => json.encode(toMap());

  factory EstadisticasYt.fromMap(Map<String, dynamic> json) => EstadisticasYt(
        kind: json["kind"],
        etag: json["etag"],
        items: json["items"] == null
            ? null
            : List<Item>.from(json["items"].map((x) => Item.fromMap(x))),
        pageInfo: json["pageInfo"] == null
            ? null
            : PageInfo.fromMap(json["pageInfo"]),
      );

  Map<String, dynamic> toMap() => {
        "kind": kind,
        "etag": etag,
        "items": List<dynamic>.from(items?.map((x) => x.toMap()) ?? []),
        "pageInfo": pageInfo?.toMap(),
      };
}

class Item {
  Item({
    this.kind,
    this.etag,
    this.id,
    this.statistics,
  });

  String? kind;
  String? etag;
  String? id;
  Statistics? statistics;

  Item copyWith({
    String? kind,
    String? etag,
    String? id,
    Statistics? statistics,
  }) =>
      Item(
        kind: kind ?? this.kind,
        etag: etag ?? this.etag,
        id: id ?? this.id,
        statistics: statistics ?? this.statistics,
      );

  factory Item.fromJson(String str) => Item.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Item.fromMap(Map<String, dynamic> json) => Item(
        kind: json["kind"],
        etag: json["etag"],
        id: json["id"],
        statistics: Statistics.fromMap(json["statistics"]),
      );

  Map<String, dynamic> toMap() => {
        "kind": kind,
        "etag": etag,
        "id": id,
        "statistics": statistics?.toMap(),
      };
}

class Statistics {
  Statistics({
    this.viewCount,
    this.likeCount,
    this.favoriteCount,
    this.commentCount,
  });

  String? viewCount;
  String? likeCount;
  String? favoriteCount;
  String? commentCount;

  Statistics copyWith({
    String? viewCount,
    String? likeCount,
    String? favoriteCount,
    String? commentCount,
  }) =>
      Statistics(
        viewCount: viewCount ?? this.viewCount,
        likeCount: likeCount ?? this.likeCount,
        favoriteCount: favoriteCount ?? this.favoriteCount,
        commentCount: commentCount ?? this.commentCount,
      );

  factory Statistics.fromJson(String str) =>
      Statistics.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Statistics.fromMap(Map<String, dynamic> json) => Statistics(
        viewCount: json["viewCount"],
        likeCount: json["likeCount"],
        favoriteCount: json["favoriteCount"],
        commentCount: json["commentCount"],
      );

  Map<String, dynamic> toMap() => {
        "viewCount": viewCount,
        "likeCount": likeCount,
        "favoriteCount": favoriteCount,
        "commentCount": commentCount,
      };
}

class PageInfo {
  PageInfo({
    this.totalResults,
    this.resultsPerPage,
  });

  int? totalResults;
  int? resultsPerPage;

  PageInfo copyWith({
    int? totalResults,
    int? resultsPerPage,
  }) =>
      PageInfo(
        totalResults: totalResults ?? this.totalResults,
        resultsPerPage: resultsPerPage ?? this.resultsPerPage,
      );

  factory PageInfo.fromJson(String str) => PageInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PageInfo.fromMap(Map<String, dynamic> json) => PageInfo(
        totalResults: json["totalResults"],
        resultsPerPage: json["resultsPerPage"],
      );

  Map<String, dynamic> toMap() => {
        "totalResults": totalResults,
        "resultsPerPage": resultsPerPage,
      };
}
