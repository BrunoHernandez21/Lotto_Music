import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/acount/acount_bloc.dart';
import '../../helpers/globals/local_storage.dart';
import '../localStorage/file_storage.dart';
import '../localStorage/local_storage.dart';

class ImageRepository {
  static Map<String, dynamic>? images;
  static const repo = StorageDir.repoImage;
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
      // ignore: unused_local_variable
      final token =
          // ignore: use_build_context_synchronously
          BlocProvider.of<AcountBloc>(context).state.acount.accessToken;
      final bits = Uint8List(1);
      // ignore: unnecessary_null_comparison
      if (bits == null) return null;
      await FileRepository.saveImage(name, bits);
      images!.addAll({name: DateTime.now().toString()});
      Repository.saveString(repo, json.encode(images));
      if (min) {
        return await FileRepository.loadImage("tumb$name");
      } else {
        return await FileRepository.loadImage(name);
      }
    } else {
      if (images![name] == null) {
        images!.addAll({name: DateTime.now().toString()});
      } else {
        images![name] = DateTime.now().toString();
      }
      Repository.saveString(repo, json.encode(images));
      if (min) {
        return await FileRepository.loadImage("tumb$name");
      } else {
        return await FileRepository.loadImage(name);
      }
    }
  }

  static Future<void> moveCacheToDocuments({
    required String newName,
    required String oldName,
  }) async {
    final oldFile = await FileRepository.loadTempImage(oldName);
    if (oldFile == null) return;
    FileRepository.saveImage(newName, oldFile.readAsBytesSync());
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
        FileRepository.loadImage(key).then((value) {
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
    FileRepository.deleteFromDocuments(name);
  }
}
