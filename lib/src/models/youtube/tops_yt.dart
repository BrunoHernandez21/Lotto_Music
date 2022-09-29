// To parse this JSON data, do
//
//     final topYoutube = topYoutubeFromMap(jsonString);

import 'dart:convert';

import 'package:lotto_music/src/models/youtube/youtube.dart';

class TopYoutube {
  TopYoutube({
    this.kind,
    this.etag,
    this.nextPageToken,
    this.items,
    this.pageInfo,
  });

  final String? kind;
  final String? etag;
  final String? nextPageToken;
  final List<ItemTops>? items;
  final PageInfo? pageInfo;

  TopYoutube copyWith({
    String? kind,
    String? etag,
    String? nextPageToken,
    List<ItemTops>? items,
    PageInfo? pageInfo,
  }) =>
      TopYoutube(
        kind: kind ?? this.kind,
        etag: etag ?? this.etag,
        nextPageToken: nextPageToken ?? this.nextPageToken,
        items: items ?? this.items,
        pageInfo: pageInfo ?? this.pageInfo,
      );

  factory TopYoutube.fromJson(String str) =>
      TopYoutube.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());
  YoutubeModel toYouModel() {
    if (items?.isEmpty ?? true) {
      return YoutubeModel();
    }
    List<ItemYT> itemsyt = [];
    for (var yt in items ?? <ItemTops>[]) {
      itemsyt.add(ItemYT(
          resourceId: yt.snippet.resourceId,
          snippet: SnippetYT(
            channelTitle: yt.snippet.channelTitle,
            title: yt.snippet.title,
            description: yt.snippet.description,
            thumbnails: yt.snippet.thumbnails,
            channelId: yt.snippet.channelId,
            publishedAt: yt.snippet.publishedAt,
          )));
    }
    return YoutubeModel(itemsyt: itemsyt);
  }

  factory TopYoutube.fromMap(Map<String, dynamic> json) => TopYoutube(
        kind: json["kind"],
        etag: json["etag"],
        nextPageToken: json["nextPageToken"],
        items:
            List<ItemTops>.from(json["items"].map((x) => ItemTops.fromMap(x))),
        pageInfo: PageInfo.fromMap(json["pageInfo"]),
      );

  Map<String, dynamic> toMap() => {
        "kind": kind,
        "etag": etag,
        "nextPageToken": nextPageToken,
        "items": items == null
            ? null
            : List<dynamic>.from(items?.map((x) => x.toMap()) ?? []),
        "pageInfo": pageInfo?.toMap(),
      };
}

class ItemTops {
  ItemTops({
    this.kind,
    this.etag,
    this.id,
    required this.snippet,
  });

  final String? kind;
  final String? etag;
  final String? id;
  final SnippetTops snippet;

  ItemTops copyWith({
    String? kind,
    String? etag,
    String? id,
    SnippetTops? snippet,
  }) =>
      ItemTops(
        kind: kind ?? this.kind,
        etag: etag ?? this.etag,
        id: id ?? this.id,
        snippet: snippet ?? this.snippet,
      );

  factory ItemTops.fromJson(String str) => ItemTops.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ItemTops.fromMap(Map<String, dynamic> json) => ItemTops(
        kind: json["kind"],
        etag: json["etag"],
        id: json["id"],
        snippet: SnippetTops.fromMap(json["snippet"]),
      );

  Map<String, dynamic> toMap() => {
        "kind": kind,
        "etag": etag,
        "id": id,
        "snippet": snippet.toMap(),
      };
}

class SnippetTops {
  SnippetTops({
    this.publishedAt,
    this.channelId,
    this.title = "",
    this.description = "",
    required this.thumbnails,
    this.channelTitle = "",
    required this.resourceId,
  });

  final DateTime? publishedAt;
  final String? channelId;
  final String title;
  final String description;
  final Thumbnails thumbnails;
  final String channelTitle;
  final ResourceId resourceId;

  SnippetTops copyWith({
    DateTime? publishedAt,
    String? channelId,
    String? title,
    String? description,
    Thumbnails? thumbnails,
    String? channelTitle,
    String? playlistId,
    int? position,
    ResourceId? resourceId,
    String? videoOwnerChannelTitle,
    String? videoOwnerChannelId,
  }) =>
      SnippetTops(
        publishedAt: publishedAt ?? this.publishedAt,
        channelId: channelId ?? this.channelId,
        title: title ?? this.title,
        description: description ?? this.description,
        thumbnails: thumbnails ?? this.thumbnails,
        channelTitle: channelTitle ?? this.channelTitle,
        resourceId: resourceId ?? this.resourceId,
      );

  factory SnippetTops.fromJson(String str) =>
      SnippetTops.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SnippetTops.fromMap(Map<String, dynamic> json) => SnippetTops(
        publishedAt: DateTime.parse(json["publishedAt"]),
        channelId: json["channelId"],
        title: json["title"],
        description: json["description"],
        thumbnails: json["thumbnails"] == null
            ? Thumbnails(
                high: Thumbnail(),
                medium: Thumbnail(),
                standard: Thumbnail(),
                thumbnailsDefault: Thumbnail(),
              )
            : Thumbnails.fromMap(json["thumbnails"]),
        channelTitle: json["channelTitle"] ?? "",
        resourceId: ResourceId.fromMap(json["resourceId"]),
      );

  Map<String, dynamic> toMap() => {
        "publishedAt": publishedAt?.toIso8601String(),
        "channelId": channelId,
        "title": title,
        "description": description,
        "thumbnails": thumbnails.toMap(),
        "channelTitle": channelTitle,
        "resourceId": resourceId.toMap(),
      };
}

class PageInfo {
  PageInfo({
    this.totalResults,
    this.resultsPerPage,
  });

  final int? totalResults;
  final int? resultsPerPage;

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
