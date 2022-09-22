// ignore: unused_import
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../helpers/globals/ruts_services.dart';
import '../../models/utility/oclock.dart';

class UtilityService {
  static const String _clock = "${URL.utility}/oclock";

  static Future<DateTime> hora() async {
    try {
      final urI = Uri.parse(_clock);
      final resp = await http.get(
        urI,
      );
      final out = OclockResponse.fromJson(resp.body);
      return out.time ?? DateTime.now();
    } catch (e) {
      return DateTime.now();
    }
  }
}
