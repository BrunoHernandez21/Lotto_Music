// To parse this JSON data, do
//
//     final searchYoutube = searchYoutubeFromMap(jsonString);

import 'dart:convert';

import 'package:lotto_music/src/models/youtube/youtube.dart';

class SearchYoutube {
  SearchYoutube({
    this.kind,
    this.etag,
    this.nextPageToken,
    this.regionCode,
    this.pageInfo,
    this.items,
  });

  final String? kind;
  final String? etag;
  final String? nextPageToken;
  final String? regionCode;
  final PageInfo? pageInfo;
  final List<ItemSearch>? items;

  SearchYoutube copyWith({
    String? kind,
    String? etag,
    String? nextPageToken,
    String? regionCode,
    PageInfo? pageInfo,
    List<ItemSearch>? items,
  }) =>
      SearchYoutube(
        kind: kind ?? this.kind,
        etag: etag ?? this.etag,
        nextPageToken: nextPageToken ?? this.nextPageToken,
        regionCode: regionCode ?? this.regionCode,
        pageInfo: pageInfo ?? this.pageInfo,
        items: items ?? this.items,
      );

  factory SearchYoutube.fromJson(String str) =>
      SearchYoutube.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());
  YoutubeModel toYouModel() {
    if (items?.isEmpty ?? true) {
      return YoutubeModel();
    }
    List<ItemYT> itemsyt = [];
    for (var yt in items ?? <ItemSearch>[]) {
      itemsyt.add(ItemYT(
          resourceId: yt.id,
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

  factory SearchYoutube.fromMap(Map<String, dynamic> json) => SearchYoutube(
        kind: json["kind"],
        etag: json["etag"],
        nextPageToken: json["nextPageToken"],
        regionCode: json["regionCode"],
        pageInfo: PageInfo.fromMap(json["pageInfo"]),
        items: List<ItemSearch>.from(
            json["items"].map((x) => ItemSearch.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "kind": kind,
        "etag": etag,
        "nextPageToken": nextPageToken,
        "regionCode": regionCode,
        "pageInfo": pageInfo?.toMap(),
        "items": List<dynamic>.from(items?.map((x) => x.toMap()) ?? []),
      };
}

class ItemSearch {
  ItemSearch({
    this.kind,
    this.etag,
    required this.id,
    required this.snippet,
  });

  final String? kind;
  final String? etag;
  final ResourceId id;
  final SnippetSearch snippet;

  ItemSearch copyWith({
    String? kind,
    String? etag,
    ResourceId? id,
    SnippetSearch? snippet,
  }) =>
      ItemSearch(
        kind: kind ?? this.kind,
        etag: etag ?? this.etag,
        id: id ?? this.id,
        snippet: snippet ?? this.snippet,
      );

  factory ItemSearch.fromJson(String str) =>
      ItemSearch.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ItemSearch.fromMap(Map<String, dynamic> json) => ItemSearch(
        kind: json["kind"],
        etag: json["etag"],
        id: json["id"] == null ? ResourceId() : ResourceId.fromMap(json["id"]),
        snippet: json["snippet"] == null
            ? SnippetSearch(
                title: "",
                channelTitle: "",
                description: "",
                thumbnails: Thumbnails(
                  high: Thumbnail(),
                  medium: Thumbnail(),
                  standard: Thumbnail(),
                  thumbnailsDefault: Thumbnail(),
                ))
            : SnippetSearch.fromMap(json["snippet"]),
      );

  Map<String, dynamic> toMap() => {
        "kind": kind,
        "etag": etag,
        "id": id.toMap(),
        "snippet": snippet.toMap(),
      };
}

class SnippetSearch {
  SnippetSearch({
    this.publishedAt,
    this.channelId,
    required this.title,
    required this.description,
    required this.thumbnails,
    required this.channelTitle,
  });

  final DateTime? publishedAt;
  final String? channelId;
  final String title;
  final String description;
  final Thumbnails thumbnails;
  final String channelTitle;

  SnippetSearch copyWith({
    DateTime? publishedAt,
    String? channelId,
    String? title,
    String? description,
    Thumbnails? thumbnails,
    String? channelTitle,
  }) =>
      SnippetSearch(
        publishedAt: publishedAt ?? this.publishedAt,
        channelId: channelId ?? this.channelId,
        title: title ?? this.title,
        description: description ?? this.description,
        thumbnails: thumbnails ?? this.thumbnails,
        channelTitle: channelTitle ?? this.channelTitle,
      );

  factory SnippetSearch.fromJson(String str) =>
      SnippetSearch.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SnippetSearch.fromMap(Map<String, dynamic> json) => SnippetSearch(
        publishedAt: DateTime.parse(json["publishedAt"]),
        channelId: json["channelId"],
        title: json["title"] ?? "",
        description: json["description"] ?? "",
        thumbnails: json["thumbnails"] == null
            ? Thumbnails(
                high: Thumbnail(),
                medium: Thumbnail(),
                standard: Thumbnail(),
                thumbnailsDefault: Thumbnail(),
              )
            : Thumbnails.fromMap(json["thumbnails"]),
        channelTitle: json["channelTitle"] ?? "",
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
