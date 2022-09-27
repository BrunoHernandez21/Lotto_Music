import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:lotto_music/src/cores/orquestador/orquestador.dart';

class DartWeb {
  static final Dio _dio = Dio();
  static late BuildContext context;

  static myInterceptor(String data) {
    final resp = json.decode(data);
    if (resp['mensaje'] == "Token invalido") {
      Orquestador.auth.onLogOut(context);
    }
  }

  // use module dio and inmpelement post
  static Future<String?> post({
    required Uri url,
    Map<String, dynamic>? body,
    String? token,
  }) async {
    Response<List<int>> resp;
    Map<String, dynamic>? headerss;
    if (token != null) {
      headerss = {
        "authorization": "Bearer $token",
      };
    }
    try {
      resp = await _dio.post<List<int>>(
        url.toString(),
        options: Options(
          contentType: "application/json; charset=utf-8",
          responseType: ResponseType.bytes,
          receiveDataWhenStatusError: true,
          validateStatus: (status) => true,
          headers: headerss,
        ),
        data: body,
      );
      if (resp.data == null) {
        return null;
      }

      final out = utf8.decode(resp.data!);
      final code = resp.statusCode ?? 0;
      if (code > 299 || code < 200) {
        myInterceptor(out);
      }
      return out;
    } catch (e) {
      return null;
    }
  }

  // use module dio and inmpelement post
  static Future<String?> put({
    required Uri url,
    required Map<String, dynamic> body,
    String? token,
  }) async {
    Response<List<int>> resp;
    Map<String, dynamic>? headerss;
    if (token != null) {
      headerss = {
        "authorization": "Bearer $token",
      };
    }
    try {
      resp = await _dio.put<List<int>>(
        url.toString(),
        options: Options(
          contentType: "application/json; charset=utf-8",
          responseType: ResponseType.bytes,
          receiveDataWhenStatusError: true,
          validateStatus: (status) => true,
          headers: headerss,
        ),
        data: body,
      );
      if (resp.data == null) {
        return null;
      }

      final out = utf8.decode(resp.data!);
      final code = resp.statusCode ?? 0;
      if (code > 299 || code < 200) {
        myInterceptor(out);
      }
      return out;
    } catch (e) {
      return null;
    }
  }

  // use module dio and inmpelement post
  static Future<String?> get({
    required Uri url,
    String? token,
  }) async {
    Response<List<int>> resp;
    Map<String, dynamic>? headerss;
    if (token != null) {
      headerss = {
        "authorization": "Bearer $token",
      };
    }
    try {
      resp = await _dio.get<List<int>>(
        url.toString(),
        options: Options(
          contentType: "application/json; charset=utf-8",
          responseType: ResponseType.bytes,
          receiveDataWhenStatusError: true,
          validateStatus: (status) => true,
          headers: headerss,
        ),
      );
      if (resp.data == null) {
        return null;
      }

      final out = utf8.decode(resp.data!);
      final code = resp.statusCode ?? 0;
      if (code > 299 || code < 200) {
        myInterceptor(out);
      }
      return out;
    } catch (e) {
      return null;
    }
  }

  // use module dio and inmpelement post
  static Future<String?> delete({
    required Uri url,
    String? token,
  }) async {
    Response<List<int>> resp;
    Map<String, dynamic>? headerss;
    if (token != null) {
      headerss = {
        "authorization": "Bearer $token",
      };
    }
    try {
      resp = await _dio.delete<List<int>>(
        url.toString(),
        options: Options(
          contentType: "application/json; charset=utf-8",
          responseType: ResponseType.bytes,
          receiveDataWhenStatusError: true,
          validateStatus: (status) => true,
          headers: headerss,
        ),
      );
      if (resp.data == null) {
        return null;
      }

      final out = utf8.decode(resp.data!);
      final code = resp.statusCode ?? 0;
      if (code > 299 || code < 200) {
        myInterceptor(out);
      }
      return out;
    } catch (e) {
      return null;
    }
  }
}
