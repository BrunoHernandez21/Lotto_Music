class URL {
  static const String ytKey = "key=AIzaSyDJGZnO3AZ2fkYOctsTClRVuShJWRMpCt8";
  //http://187.213.26.255:25567
  //https://lotto.inclusive.com.mx
  static const String socket = 'https://187.213.26.255:25567';
  //http://187.213.26.255:25566/api/v3/
  //https://lotto.inclusive.com.mx/api/v3/
  static const String _base = "http://187.213.26.255:25566/api/v3/";
  static const String _baseYT = "http://www.googleapis.com/youtube/v3";
  static const String searchYT = "$_baseYT/search?$ytKey";
  static const String listItems = "$_baseYT/playlistItems?$ytKey";
  static const String estYT = "$_baseYT/videos?$ytKey";

  static const String auth = "${_base}auth";
  static const String buy = "${_base}buy";
  static const String event = "${_base}event";
  static const String plan = "${_base}plan";
  static const String shoppingcar = "${_base}shoppingcar";
  static const String user = "${_base}user";
  static const String userEvent = "${_base}user-event";
  static const String utility = "${_base}utils";
  static const String videos = "${_base}video";
}
