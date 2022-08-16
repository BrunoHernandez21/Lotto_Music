import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/acount/acount_bloc.dart';
import '../../helpers/variables_globales.dart';
import '../../services/cloud_service.dart';
import '../repository.dart';

class ImageRepository {
  static Map<String, dynamic>? images;
  static const repo = LocalStorage.repoImage;
  static _loadInitData() async {
    final data = await Repository.loadString(repo);
    if (data == null) {
      images = {};
      return;
    }
    if (data == "") return {};
    images = json.decode(data);
  }

  static Future<File?> fileImage(
    String name,
    BuildContext context,
    bool min,
  ) async {
    if (images == null) await _loadInitData();

    if (images![name] == null) {
      // ignore: use_build_context_synchronously
      final token =
          BlocProvider.of<AcountBloc>(context).state.acount.accessToken;
      final bits = await CloudService.downloadImage(token);
      if (bits == null) return null;
      await Repository.saveImage(name, bits);
      images!.addAll({name: DateTime.now().toString()});
      Repository.saveString(repo, json.encode(images));
      if (min) {
        return await Repository.loadImage("tumb$name");
      } else {
        return await Repository.loadImage(name);
      }
    } else {
      if (images![name] == null) {
        images!.addAll({name: DateTime.now().toString()});
      } else {
        images![name] = DateTime.now().toString();
      }
      Repository.saveString(repo, json.encode(images));
      if (min) {
        return await Repository.loadImage("tumb$name");
      } else {
        return await Repository.loadImage(name);
      }
    }
  }

  static Future<void> moveCacheToDocuments({
    required String newName,
    required String oldName,
  }) async {
    final oldFile = await Repository.loadTempImage(oldName);
    if (oldFile == null) return;
    Repository.saveImage(newName, oldFile.readAsBytesSync());
    images!.addAll({newName: DateTime.now().toString()});
    Repository.saveString(repo, json.encode(images));
  }

  static Future<void> checkImageStatus() async {
    if (images == null) await _loadInitData();
    images ??= {};
    images!.forEach((key, value) {
      final datee = DateTime.parse(value);
      final lastView = datee.month * 30 + datee.day;
      final now = DateTime.now().month * 30 + DateTime.now().day;

      if (now > lastView + 3) {
        Repository.loadImage(key).then((value) {
          value?.delete();
          images!.remove(key);
        });
      }
    });
  }

  static Future<void> removeFromExternal(String name) async {
    if (images![name] != null) {
      images!.remove(name);
    }
    Repository.deleteFromDocuments(name);
  }
}
