// To parse this JSON data, do
//
//     final youtubeModel = youtubeModelFromMap(jsonString);

import 'dart:convert';

class YoutubeModel {
  YoutubeModel({
    this.itemsyt,
  });

  List<ItemYT>? itemsyt;
  YoutubeModel copyWith({
    List<ItemYT>? itemsyt,
  }) =>
      YoutubeModel(
        itemsyt: itemsyt ?? this.itemsyt,
      );

  factory YoutubeModel.fromJson(String str) {
    try {
      return YoutubeModel.fromMap(json.decode(str));
    } catch (e) {
      return YoutubeModel();
    }
  }

  String toJson() => json.encode(toMap());

  factory YoutubeModel.fromMap(Map<String, dynamic> json) => YoutubeModel(
        itemsyt: json["items"] == null
            ? null
            : List<ItemYT>.from(json["items"].map((x) => ItemYT.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "items": List<dynamic>.from(itemsyt?.map((x) => x.toMap()) ?? []),
      };
}

class ItemYT {
  ItemYT({
    required this.resourceId,
    required this.snippet,
  });

  ResourceId resourceId;
  SnippetYT snippet;

  ItemYT copyWith({
    ResourceId? resourceId,
    SnippetYT? snippet,
  }) =>
      ItemYT(
        resourceId: resourceId ?? this.resourceId,
        snippet: snippet ?? this.snippet,
      );

  factory ItemYT.fromJson(String str) => ItemYT.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ItemYT.fromMap(Map<String, dynamic> json) => ItemYT(
        resourceId: json["resourceId"],
        snippet: json["snippet"] == null
            ? SnippetYT(
                channelTitle: "",
                description: "",
                title: "",
                thumbnails: Thumbnails(
                  high: Thumbnail(),
                  medium: Thumbnail(),
                  standard: Thumbnail(),
                  thumbnailsDefault: Thumbnail(),
                ),
              )
            : SnippetYT.fromMap(json["snippet"]),
      );

  Map<String, dynamic> toMap() => {
        "resourceId": resourceId,
        "snippet": snippet.toMap(),
      };
}

class SnippetYT {
  SnippetYT({
    this.publishedAt,
    this.channelId,
    required this.title,
    required this.description,
    required this.thumbnails,
    required this.channelTitle,
  });

  DateTime? publishedAt;
  String? channelId;
  String title;
  String description;
  Thumbnails thumbnails;
  String channelTitle;

  SnippetYT copyWith({
    DateTime? publishedAt,
    String? channelId,
    String? title,
    String? description,
    Thumbnails? thumbnails,
    String? channelTitle,
  }) =>
      SnippetYT(
        publishedAt: publishedAt ?? this.publishedAt,
        channelId: channelId ?? this.channelId,
        title: title ?? this.title,
        description: description ?? this.description,
        thumbnails: thumbnails ?? this.thumbnails,
        channelTitle: channelTitle ?? this.channelTitle,
      );

  factory SnippetYT.fromJson(String str) => SnippetYT.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SnippetYT.fromMap(Map<String, dynamic> json) => SnippetYT(
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]).toLocal(),
        channelId: json["channelId"],
        title: json["title"],
        description: json["description"],
        thumbnails: Thumbnails.fromMap(json["thumbnails"]),
        channelTitle: json["channelTitle"],
      );

  Map<String, dynamic> toMap() => {
        "publishedAt": publishedAt?.toIso8601String(),
        "channelId": channelId,
        "title": title,
        "description": description,
        "thumbnails": thumbnails.toMap(),
        "channelTitle": channelTitle,
      };
}

class Thumbnails {
  Thumbnails({
    required this.thumbnailsDefault,
    required this.medium,
    this.high,
    this.standard,
    this.maxres,
  });

  final Thumbnail thumbnailsDefault;
  final Thumbnail medium;
  final Thumbnail? high;
  final Thumbnail? standard;
  final Thumbnail? maxres;

  Thumbnails copyWith({
    Thumbnail? thumbnailsDefault,
    Thumbnail? medium,
    Thumbnail? high,
    Thumbnail? standard,
    Thumbnail? maxres,
  }) =>
      Thumbnails(
        thumbnailsDefault: thumbnailsDefault ?? this.thumbnailsDefault,
        medium: medium ?? this.medium,
        high: high ?? this.high,
        standard: standard ?? this.standard,
        maxres: maxres ?? this.maxres,
      );

  factory Thumbnails.fromJson(String str) =>
      Thumbnails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Thumbnails.fromMap(Map<String, dynamic> json) => Thumbnails(
        thumbnailsDefault: json["default"] == null
            ? Thumbnail()
            : Thumbnail.fromMap(json["default"]),
        medium: json["medium"] == null
            ? Thumbnail()
            : Thumbnail.fromMap(json["medium"]),
        high: json["high"] == null
            ? Thumbnail()
            : Thumbnail.fromMap(json["high"]),
        standard: json["standard"] == null
            ? Thumbnail()
            : Thumbnail.fromMap(json["standard"]),
        maxres:
            json["maxres"] == null ? null : Thumbnail.fromMap(json["maxres"]),
      );

  Map<String, dynamic> toMap() => {
        "default": thumbnailsDefault.toMap(),
        "medium": medium.toMap(),
        "high": high?.toMap(),
        "standard": standard?.toMap(),
        "maxres": maxres?.toMap(),
      };
}

class Thumbnail {
  Thumbnail({
    this.url = "",
    this.width = 0,
    this.height = 0,
  });

  final String url;
  final int width;
  final int height;

  Thumbnail copyWith({
    String? url,
    int? width,
    int? height,
  }) =>
      Thumbnail(
        url: url ?? this.url,
        width: width ?? this.width,
        height: height ?? this.height,
      );

  factory Thumbnail.fromJson(String str) => Thumbnail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Thumbnail.fromMap(Map<String, dynamic> json) => Thumbnail(
        url: json["url"] ?? "",
        width: json["width"] ?? 0,
        height: json["height"] ?? 0,
      );

  Map<String, dynamic> toMap() => {
        "url": url,
        "width": width,
        "height": height,
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

class ResourceId {
  ResourceId({
    this.kind = "",
    this.videoId = "",
  });

  final String kind;
  final String videoId;

  ResourceId copyWith({
    String? kind,
    String? videoId,
  }) =>
      ResourceId(
        kind: kind ?? this.kind,
        videoId: videoId ?? this.videoId,
      );

  factory ResourceId.fromJson(String str) =>
      ResourceId.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResourceId.fromMap(Map<String, dynamic> json) => ResourceId(
        kind: json["kind"] ?? "",
        videoId: json["videoId"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "kind": kind,
        "videoId": videoId,
      };
}
