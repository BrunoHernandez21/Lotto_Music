import 'enviroments.dart';

class URL {
  // Api Rest
  // childrends
  static const String auth = "${ENV.base}auth";
  static const String buy = "${ENV.base}buy";
  static const String event = "${ENV.base}event";
  static const String plan = "${ENV.base}plan";
  static const String shoppingcar = "${ENV.base}shoppingcar";
  static const String user = "${ENV.base}user";
  static const String userEvent = "${ENV.base}user-event";
  static const String utility = "${ENV.base}utils";
  static const String videos = "${ENV.base}video";
  // // // // // // // // // // //
  // childrends
  static const searchYT = "${ENV.baseYT}/search?${ENV.ytKey}";
  static const listItems = "${ENV.baseYT}/playlistItems?${ENV.ytKey}";
  static const estYT = "${ENV.baseYT}/videos?${ENV.ytKey}";
}
