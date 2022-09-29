// ignore: unused_import
import 'dart:convert';

import '../../cores/webDart/webcontroller.dart';
import '../../helpers/globals/routes_services.dart';
import '../../models/utility/oclock.dart';

class UtilityService {
  static const String _clock = "${URL.utility}/oclock";

  static Future<DateTime> hora() async {
    final urI = Uri.parse(_clock);
    final resp = await DartWeb.get(
      url: urI,
    );
    if (resp == null) {
      return DateTime.now();
    }
    final out = OclockResponse.fromJson(resp);
    return out.time ?? DateTime.now();
  }
}
