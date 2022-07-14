// To parse this JSON data, do
//
//     final youtubeModel = youtubeModelFromMap(jsonString);

import 'dart:convert';

class YoutubeModel {
  YoutubeModel({
    this.kind,
    this.etag,
    this.nextPageToken,
    this.regionCode,
    this.pageInfo,
    this.itemsyt,
  });

  String? kind;
  String? etag;
  String? nextPageToken;
  String? regionCode;
  PageInfo? pageInfo;
  List<ItemYT>? itemsyt;

  YoutubeModel copyWith({
    String? kind,
    String? etag,
    String? nextPageToken,
    String? regionCode,
    PageInfo? pageInfo,
    List<ItemYT>? itemsyt,
  }) =>
      YoutubeModel(
        kind: kind ?? this.kind,
        etag: etag ?? this.etag,
        nextPageToken: nextPageToken ?? this.nextPageToken,
        regionCode: regionCode ?? this.regionCode,
        pageInfo: pageInfo ?? this.pageInfo,
        itemsyt: itemsyt ?? this.itemsyt,
      );

  factory YoutubeModel.fromJson(String str) =>
      YoutubeModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory YoutubeModel.fromMap(Map<String, dynamic> json) => YoutubeModel(
        kind: json["kind"],
        etag: json["etag"],
        nextPageToken: json["nextPageToken"],
        regionCode: json["regionCode"],
        pageInfo: PageInfo.fromMap(json["pageInfo"]),
        itemsyt: json["items"] == null
            ? null
            : List<ItemYT>.from(json["items"].map((x) => ItemYT.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "kind": kind,
        "etag": etag,
        "nextPageToken": nextPageToken,
        "regionCode": regionCode,
        "pageInfo": pageInfo?.toMap(),
        "items": List<dynamic>.from(itemsyt?.map((x) => x.toMap()) ?? []),
      };
}

class ItemYT {
  ItemYT({
    this.kind,
    this.etag,
    this.id,
    this.snippet,
  });

  String? kind;
  String? etag;
  Id? id;
  Snippet? snippet;

  ItemYT copyWith({
    String? kind,
    String? etag,
    Id? id,
    Snippet? snippet,
  }) =>
      ItemYT(
        kind: kind ?? this.kind,
        etag: etag ?? this.etag,
        id: id ?? this.id,
        snippet: snippet ?? this.snippet,
      );

  factory ItemYT.fromJson(String str) => ItemYT.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ItemYT.fromMap(Map<String, dynamic> json) => ItemYT(
        kind: json["kind"],
        etag: json["etag"],
        id: Id.fromMap(json["id"]),
        snippet:
            json["snippet"] == null ? null : Snippet.fromMap(json["snippet"]),
      );

  Map<String, dynamic> toMap() => {
        "kind": kind,
        "etag": etag,
        "id": id?.toMap(),
        "snippet": snippet?.toMap(),
      };
}

class Id {
  Id({
    this.kind,
    this.videoId,
  });

  String? kind;
  String? videoId;

  Id copyWith({
    String? kind,
    String? videoId,
  }) =>
      Id(
        kind: kind ?? this.kind,
        videoId: videoId ?? this.videoId,
      );

  factory Id.fromJson(String str) => Id.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Id.fromMap(Map<String, dynamic> json) => Id(
        kind: json["kind"],
        videoId: json["videoId"],
      );

  Map<String, dynamic> toMap() => {
        "kind": kind,
        "videoId": videoId,
      };
}

class Snippet {
  Snippet({
    this.publishedAt,
    this.channelId,
    this.title,
    this.description,
    this.thumbnails,
    this.channelTitle,
    this.liveBroadcastContent,
    this.publishTime,
  });

  DateTime? publishedAt;
  String? channelId;
  String? title;
  String? description;
  Thumbnails? thumbnails;
  String? channelTitle;
  String? liveBroadcastContent;
  DateTime? publishTime;

  Snippet copyWith({
    DateTime? publishedAt,
    String? channelId,
    String? title,
    String? description,
    Thumbnails? thumbnails,
    String? channelTitle,
    String? liveBroadcastContent,
    DateTime? publishTime,
  }) =>
      Snippet(
        publishedAt: publishedAt ?? this.publishedAt,
        channelId: channelId ?? this.channelId,
        title: title ?? this.title,
        description: description ?? this.description,
        thumbnails: thumbnails ?? this.thumbnails,
        channelTitle: channelTitle ?? this.channelTitle,
        liveBroadcastContent: liveBroadcastContent ?? this.liveBroadcastContent,
        publishTime: publishTime ?? this.publishTime,
      );

  factory Snippet.fromJson(String str) => Snippet.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Snippet.fromMap(Map<String, dynamic> json) => Snippet(
        publishedAt: DateTime.parse(json["publishedAt"]),
        channelId: json["channelId"],
        title: json["title"],
        description: json["description"],
        thumbnails: Thumbnails.fromMap(json["thumbnails"]),
        channelTitle: json["channelTitle"],
        liveBroadcastContent: json["liveBroadcastContent"],
        publishTime: DateTime.parse(json["publishTime"]),
      );

  Map<String, dynamic> toMap() => {
        "publishedAt": publishedAt?.toIso8601String(),
        "channelId": channelId,
        "title": title,
        "description": description,
        "thumbnails": thumbnails?.toMap(),
        "channelTitle": channelTitle,
        "liveBroadcastContent": liveBroadcastContent,
        "publishTime": publishTime?.toIso8601String(),
      };
}

class Thumbnails {
  Thumbnails({
    this.thumbnailsDefault,
    this.medium,
    this.high,
  });

  Default? thumbnailsDefault;
  Default? medium;
  Default? high;

  Thumbnails copyWith({
    Default? thumbnailsDefault,
    Default? medium,
    Default? high,
  }) =>
      Thumbnails(
        thumbnailsDefault: thumbnailsDefault ?? this.thumbnailsDefault,
        medium: medium ?? this.medium,
        high: high ?? this.high,
      );

  factory Thumbnails.fromJson(String str) =>
      Thumbnails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Thumbnails.fromMap(Map<String, dynamic> json) => Thumbnails(
        thumbnailsDefault: Default.fromMap(json["default"]),
        medium: Default.fromMap(json["medium"]),
        high: Default.fromMap(json["high"]),
      );

  Map<String, dynamic> toMap() => {
        "default": thumbnailsDefault?.toMap(),
        "medium": medium?.toMap(),
        "high": high?.toMap(),
      };
}

class Default {
  Default({
    this.url,
    this.width,
    this.height,
  });

  String? url;
  int? width;
  int? height;

  Default copyWith({
    String? url,
    int? width,
    int? height,
  }) =>
      Default(
        url: url ?? this.url,
        width: width ?? this.width,
        height: height ?? this.height,
      );

  factory Default.fromJson(String str) => Default.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Default.fromMap(Map<String, dynamic> json) => Default(
        url: json["url"],
        width: json["width"],
        height: json["height"],
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
