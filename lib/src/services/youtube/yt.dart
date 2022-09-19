// ignore: unused_import
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../helpers/globals/ruts_services.dart';
import '../../models/youtube/estadisticvas_yt.dart';
import '../../models/youtube/youtube.dart';

class YTService {
  static const String _tops =
      "${URL.searchYT}&type=video&part=snippet&chart=mostPopular&regionCode=MX&safeSearch=none&maxResults=10&videoEmbeddable=true";
  static const String _relative =
      "${URL.searchYT}&type=video&maxResults=10&part=snippet&relatedToVideoId=";
  static const String _search =
      "${URL.searchYT}&type=video&maxResults=10&part=snippet&maxResults=10&q=";
  static const String _estadisticas = "${URL.estYT}&part=statistics&id=";
/////////////////////////////
  /// separador
  static Future<YoutubeModel?> top() async {
    try {
      final urI = Uri.parse(_tops);
      final resp = await http.get(
        urI,
      );
      final out = YoutubeModel.fromJson(resp.body);
      return out;
    } catch (e) {
      return null;
    }
  }

  static Future<YoutubeModel?> busqueda({required String query}) async {
    final urI = Uri.parse(_search + query.replaceAll(" ", "+"));
    final resp = await http.get(
      urI,
    );
    final out = YoutubeModel.fromJson(resp.body);
    return out;
  }

  static Future<YoutubeModel?> relative({required String ytID}) async {
    final urI = Uri.parse(_relative + ytID);
    final resp = await http.get(
      urI,
    );
    final out = YoutubeModel.fromJson(resp.body);
    if (out.itemsyt?.isNotEmpty ?? false) {
      List<ItemYT> corrector = [];
      out.itemsyt?.forEach((element) {
        if (element.snippet != null) {
          corrector.add(element);
        }
      });
      out.itemsyt = corrector;
      return out;
    }

    return out;
  }

  static Future<EstadisticasYt?> estadisticas({required String ytID}) async {
    final urI = Uri.parse(_estadisticas + ytID);
    final resp = await http.get(
      urI,
    );
    final out = EstadisticasYt.fromJson(resp.body);
    return out;
  }
}

final temporal = {
  "kind": "youtube#searchListResponse",
  "etag": "NCCA22DcoHcAHSyOIGApt_DDlPc",
  "nextPageToken": "CAoQAA",
  "regionCode": "MX",
  "pageInfo": {"totalResults": 1000000, "resultsPerPage": 10},
  "items": [
    {
      "kind": "youtube#searchResult",
      "etag": "FZzH9Yx6daBLK5WPDSRQzvvJk8c",
      "id": {"kind": "youtube#video", "videoId": "jcqut44iowU"},
      "snippet": {
        "publishedAt": "2018-10-30T05:21:01Z",
        "channelId": "UCWJ2lWNubArHWmf3FIHbfcQ",
        "title": "NBA Top 10 Plays of the Night | October 29, 2018",
        "description":
            "Check out the top 10 plays of the night around the NBA, featuring Rudy Gay, DeMar DeRozan, Jon Henson, Jimmy Butler, Jarrett ...",
        "thumbnails": {
          "default": {
            "url": "https://i.ytimg.com/vi/jcqut44iowU/default.jpg",
            "width": 120,
            "height": 90
          },
          "medium": {
            "url": "https://i.ytimg.com/vi/jcqut44iowU/mqdefault.jpg",
            "width": 320,
            "height": 180
          },
          "high": {
            "url": "https://i.ytimg.com/vi/jcqut44iowU/hqdefault.jpg",
            "width": 480,
            "height": 360
          }
        },
        "channelTitle": "NBA",
        "liveBroadcastContent": "none",
        "publishTime": "2018-10-30T05:21:01Z"
      }
    },
    {
      "kind": "youtube#searchResult",
      "etag": "G-TIeTgOVq16kctpS3VAitOXhz4",
      "id": {"kind": "youtube#video", "videoId": "2nIiweKhUfo"},
      "snippet": {
        "publishedAt": "2011-03-24T22:03:07Z",
        "channelId": "UCWJ2lWNubArHWmf3FIHbfcQ",
        "title": "Blake vs JaVale..... Again",
        "description":
            "In a thrilling double overtime game, Griffin and McGee went slam for slam against each other, continuing the dunking rivalry that ...",
        "thumbnails": {
          "default": {
            "url": "https://i.ytimg.com/vi/2nIiweKhUfo/default.jpg",
            "width": 120,
            "height": 90
          },
          "medium": {
            "url": "https://i.ytimg.com/vi/2nIiweKhUfo/mqdefault.jpg",
            "width": 320,
            "height": 180
          },
          "high": {
            "url": "https://i.ytimg.com/vi/2nIiweKhUfo/hqdefault.jpg",
            "width": 480,
            "height": 360
          }
        },
        "channelTitle": "NBA",
        "liveBroadcastContent": "none",
        "publishTime": "2011-03-24T22:03:07Z"
      }
    },
    {
      "kind": "youtube#searchResult",
      "etag": "TXXGfCIWdJZJQ1A-CodIsy7TBfs",
      "id": {"kind": "youtube#video", "videoId": "4S1x80-9Ef4"},
      "snippet": {
        "publishedAt": "2018-02-18T17:00:00Z",
        "channelId": "UCWJ2lWNubArHWmf3FIHbfcQ",
        "title": "SOUND UP: Team LeBron | 2018 NBA All-Star Game",
        "description":
            "Are you ready for TEAM LEBRON!?! Check out the Team LeBron edition of SOUND UP before LeBron James leads his squad of ...",
        "thumbnails": {
          "default": {
            "url": "https://i.ytimg.com/vi/4S1x80-9Ef4/default.jpg",
            "width": 120,
            "height": 90
          },
          "medium": {
            "url": "https://i.ytimg.com/vi/4S1x80-9Ef4/mqdefault.jpg",
            "width": 320,
            "height": 180
          },
          "high": {
            "url": "https://i.ytimg.com/vi/4S1x80-9Ef4/hqdefault.jpg",
            "width": 480,
            "height": 360
          }
        },
        "channelTitle": "NBA",
        "liveBroadcastContent": "none",
        "publishTime": "2018-02-18T17:00:00Z"
      }
    },
    {
      "kind": "youtube#searchResult",
      "etag": "vSIHh9bsJ5cx8Lf4Z_MjSrl3SEo",
      "id": {"kind": "youtube#video", "videoId": "BPidLpADlaM"},
      "snippet": {
        "publishedAt": "2009-10-03T04:48:00Z",
        "channelId": "UCGnjeahCJW1AF34HBmQTJ-Q",
        "title": "Shakira - Dia de Enero (Official HD Video)",
        "description":
            "Vídeo oficial de Shakira de su tema 'Dia De Enero'. Haz clic aquí para escuchar a Shakira en Spotify: http://smarturl.it/ShakiraSpot ...",
        "thumbnails": {
          "default": {
            "url": "https://i.ytimg.com/vi/BPidLpADlaM/default.jpg",
            "width": 120,
            "height": 90
          },
          "medium": {
            "url": "https://i.ytimg.com/vi/BPidLpADlaM/mqdefault.jpg",
            "width": 320,
            "height": 180
          },
          "high": {
            "url": "https://i.ytimg.com/vi/BPidLpADlaM/hqdefault.jpg",
            "width": 480,
            "height": 360
          }
        },
        "channelTitle": "shakiraVEVO",
        "liveBroadcastContent": "none",
        "publishTime": "2009-10-03T04:48:00Z"
      }
    },
    {
      "kind": "youtube#searchResult",
      "etag": "Df9IIRBTPVpTXEvY--jAmD1NLuE",
      "id": {"kind": "youtube#video", "videoId": "A9jLXgkmW6k"},
      "snippet": {
        "publishedAt": "2019-01-28T05:50:42Z",
        "channelId": "UCWJ2lWNubArHWmf3FIHbfcQ",
        "title": "NBA Top 10 Plays of the Night | January 27, 2019",
        "description":
            "Check out the top 10 plays of the night featuring Luka Doncic, Dwyane Wade , Montrezl Harrell, Aaron Gordon, Paul George and ...",
        "thumbnails": {
          "default": {
            "url": "https://i.ytimg.com/vi/A9jLXgkmW6k/default.jpg",
            "width": 120,
            "height": 90
          },
          "medium": {
            "url": "https://i.ytimg.com/vi/A9jLXgkmW6k/mqdefault.jpg",
            "width": 320,
            "height": 180
          },
          "high": {
            "url": "https://i.ytimg.com/vi/A9jLXgkmW6k/hqdefault.jpg",
            "width": 480,
            "height": 360
          }
        },
        "channelTitle": "NBA",
        "liveBroadcastContent": "none",
        "publishTime": "2019-01-28T05:50:42Z"
      }
    },
    {
      "kind": "youtube#searchResult",
      "etag": "YF5bOZaMqlCRzFM0ZtUiNdHiC1k",
      "id": {"kind": "youtube#video", "videoId": "onlZQ0jKUZc"},
      "snippet": {
        "publishedAt": "2020-10-06T20:00:10Z",
        "channelId": "UCGnjeahCJW1AF34HBmQTJ-Q",
        "title": "Shakira - Antologia (El Dorado World Tour - Live)",
        "description":
            "Shakira – Antologia (El Dorado World Tour - Live) Pies Descalzos: https://smarturl.it/pies-descalzos Official site: ...",
        "thumbnails": {
          "default": {
            "url": "https://i.ytimg.com/vi/onlZQ0jKUZc/default.jpg",
            "width": 120,
            "height": 90
          },
          "medium": {
            "url": "https://i.ytimg.com/vi/onlZQ0jKUZc/mqdefault.jpg",
            "width": 320,
            "height": 180
          },
          "high": {
            "url": "https://i.ytimg.com/vi/onlZQ0jKUZc/hqdefault.jpg",
            "width": 480,
            "height": 360
          }
        },
        "channelTitle": "shakiraVEVO",
        "liveBroadcastContent": "none",
        "publishTime": "2020-10-06T20:00:10Z"
      }
    },
    {
      "kind": "youtube#searchResult",
      "etag": "m2UYoWrKoyeMLLwMBd-u4NFIITk",
      "id": {"kind": "youtube#video", "videoId": "Pm6IXg1oEL4"},
      "snippet": {
        "publishedAt": "2011-11-03T04:00:00Z",
        "channelId": "UCGnjeahCJW1AF34HBmQTJ-Q",
        "title": "Shakira - Antes De Las Seis (Live From Paris)",
        "description":
            "Vídeo oficial de Shakira de su tema 'Antes De Las Seis (Live from Paris)'. Haz clic aquí para escuchar a Shakira en Spotify: ...",
        "thumbnails": {
          "default": {
            "url": "https://i.ytimg.com/vi/Pm6IXg1oEL4/default.jpg",
            "width": 120,
            "height": 90
          },
          "medium": {
            "url": "https://i.ytimg.com/vi/Pm6IXg1oEL4/mqdefault.jpg",
            "width": 320,
            "height": 180
          },
          "high": {
            "url": "https://i.ytimg.com/vi/Pm6IXg1oEL4/hqdefault.jpg",
            "width": 480,
            "height": 360
          }
        },
        "channelTitle": "shakiraVEVO",
        "liveBroadcastContent": "none",
        "publishTime": "2011-11-03T04:00:00Z"
      }
    },
    {
      "kind": "youtube#searchResult",
      "etag": "FUO66vGKjT5rQMFePUMxRqIgYcM",
      "id": {"kind": "youtube#video", "videoId": "amRYL-7pVAs"},
      "snippet": {
        "publishedAt": "2022-02-06T17:09:09Z",
        "channelId": "UCWyvMe8OQZrGcHjS93emIDg",
        "title": "QuadSense Technology: The Next Level in Flame Detection",
        "description":
            "With its Extended effective coverage for cost reduction, ultra-fast response time to improve safety, and unparalleled false alarm ...",
        "thumbnails": {
          "default": {
            "url": "https://i.ytimg.com/vi/amRYL-7pVAs/default.jpg",
            "width": 120,
            "height": 90
          },
          "medium": {
            "url": "https://i.ytimg.com/vi/amRYL-7pVAs/mqdefault.jpg",
            "width": 320,
            "height": 180
          },
          "high": {
            "url": "https://i.ytimg.com/vi/amRYL-7pVAs/hqdefault.jpg",
            "width": 480,
            "height": 360
          }
        },
        "channelTitle": "Spectrex",
        "liveBroadcastContent": "none",
        "publishTime": "2022-02-06T17:09:09Z"
      }
    },
    {
      "kind": "youtube#searchResult",
      "etag": "z5fuCAZtmTGCKA-ko1lrGZOjfJo",
      "id": {"kind": "youtube#video", "videoId": "N31b8DrmzVM"},
      "snippet": {
        "publishedAt": "2009-11-18T08:08:29Z",
        "channelId": "UCGnjeahCJW1AF34HBmQTJ-Q",
        "title": "Shakira - Lo Hecho Está Hecho (Official HD Video)",
        "description":
            "Official HD Video \"Lo Hecho Está Hecho\" by Shakira Listen to Shakira: https://Shakira.lnk.to/listen_YD Watch more videos by ...",
        "thumbnails": {
          "default": {
            "url": "https://i.ytimg.com/vi/N31b8DrmzVM/default.jpg",
            "width": 120,
            "height": 90
          },
          "medium": {
            "url": "https://i.ytimg.com/vi/N31b8DrmzVM/mqdefault.jpg",
            "width": 320,
            "height": 180
          },
          "high": {
            "url": "https://i.ytimg.com/vi/N31b8DrmzVM/hqdefault.jpg",
            "width": 480,
            "height": 360
          }
        },
        "channelTitle": "shakiraVEVO",
        "liveBroadcastContent": "none",
        "publishTime": "2009-11-18T08:08:29Z"
      }
    },
    {
      "kind": "youtube#searchResult",
      "etag": "hWPbXOs-oyK4Up_O4MVJKCJb-CA",
      "id": {"kind": "youtube#video", "videoId": "lE9lkSdtZeQ"},
      "snippet": {
        "publishedAt": "2013-07-16T14:59:58Z",
        "channelId": "UC3IZKseVpdzPSBaWxBxundA",
        "title": "BTS (방탄소년단) &#39;We Are Bulletproof Pt.2&#39; Official MV",
        "description":
            "Official Homepage : http://bts.ibighit.com BTS Blog : http://btsblog.ibighit.com Official Facebook ...",
        "thumbnails": {
          "default": {
            "url": "https://i.ytimg.com/vi/lE9lkSdtZeQ/default.jpg",
            "width": 120,
            "height": 90
          },
          "medium": {
            "url": "https://i.ytimg.com/vi/lE9lkSdtZeQ/mqdefault.jpg",
            "width": 320,
            "height": 180
          },
          "high": {
            "url": "https://i.ytimg.com/vi/lE9lkSdtZeQ/hqdefault.jpg",
            "width": 480,
            "height": 360
          }
        },
        "channelTitle": "HYBE LABELS",
        "liveBroadcastContent": "none",
        "publishTime": "2013-07-16T14:59:58Z"
      }
    }
  ]
};
