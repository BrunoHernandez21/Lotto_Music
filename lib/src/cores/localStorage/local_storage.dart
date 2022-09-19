import 'dart:async';
import 'package:localstorage/localstorage.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../helpers/globals/local_storage.dart';

class Repository {
  static String? path;
  static String? temphat;
  static final LocalStorage rImage = LocalStorage(StorageDir.repoImage);
  static final LocalStorage rAuthUser = LocalStorage(StorageDir.authUser);
  static final LocalStorage rUser = LocalStorage(StorageDir.repoUser);
  static final LocalStorage rDataUser = LocalStorage(StorageDir.repoDataUser);
  static final LocalStorage rYoutube = LocalStorage(StorageDir.repoYoutube);
  static final LocalStorage rRepoSistem = LocalStorage(StorageDir.repoSistem);

  static bool isRepoSistem = false;
  static bool isImage = false;
  static bool isAuthUser = false;
  static bool isUser = false;
  static bool isDataUser = false;
  static bool isYoutube = false;

  //////////////////// String
  static Future<String?> loadString(String name) async {
    try {
      final db = await _selector(name);
      if (db == null) return null;
      final resp = db.getItem(name);
      _exitArchive(name);
      if (resp.runtimeType == String) {
        return resp;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  static Future<void> saveString(String name, String data) async {
    try {
      final db = await _selector(name);
      if (db == null) return;
      await db.setItem(name, data);
      _exitArchive(name);
    } catch (e) {
      return;
    }
  }

  //////////////// Double
  static Future<double?> loadDouble(String name, double data) async {
    final db = await _selector(name);
    if (db == null) return null;
    try {
      final resp = db.getItem(name);
      _exitArchive(name);
      if (resp.runtimeType == double) {
        return resp;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  static Future<void> saveDouble(String name, double data) async {
    final db = await _selector(name);
    if (db == null) return;
    try {
      await db.setItem(name, data);
      _exitArchive(name);
    } catch (e) {
      return;
    }
  }

  /////////////// int
  static Future<int?> loadInt(String name) async {
    final db = await _selector(name);
    if (db == null) return null;
    try {
      final resp = db.getItem(name);
      _exitArchive(name);
      if (resp.runtimeType == int) {
        return resp;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  static Future<void> saveInt(String name, int data) async {
    final db = await _selector(name);
    if (db == null) return;
    try {
      await db.setItem(name, data);
      _exitArchive(name);
    } catch (e) {
      return;
    }
  }

  ////////////////Bool
  static Future<bool?> loadBool(String name) async {
    final db = await _selector(name);
    if (db == null) return null;
    try {
      final resp = db.getItem(name);
      _exitArchive(name);
      if (resp.runtimeType == bool) {
        return resp;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  static Future<void> saveBool(String name, bool data) async {
    final db = await _selector(name);
    if (db == null) return;
    try {
      await db.setItem(name, data);
      _exitArchive(name);
    } catch (e) {
      return;
    }
  }

  ///////////////// Logical
  //// logic

  static Future<LocalStorage?> _selector(
    String input,
  ) async {
    LocalStorage? out;
    bool status = await Permission.storage.isGranted;
    if (!status) await Permission.storage.request();
    switch (input) {
      case StorageDir.repoImage:
        {
          if (await rImage.ready) {
            out = rImage;
          }
          while (isImage) {
            await Future.delayed(const Duration(microseconds: 500), () {});
          }
          isImage = true;
        }
        break;
      case StorageDir.authUser:
        {
          if (await rAuthUser.ready) {
            out = rAuthUser;
          }
          while (isAuthUser) {
            await Future.delayed(const Duration(microseconds: 500), () {});
          }
          isImage = true;
        }
        break;
      case StorageDir.repoUser:
        {
          if (await rUser.ready) {
            out = rUser;
          }
          while (isUser) {
            await Future.delayed(const Duration(microseconds: 500), () {});
          }
          isImage = true;
        }
        break;
      case StorageDir.repoDataUser:
        {
          if (await rDataUser.ready) {
            out = rDataUser;
          }
          while (isDataUser) {
            await Future.delayed(const Duration(microseconds: 500), () {});
          }
          isImage = true;
        }
        break;
      case StorageDir.repoYoutube:
        {
          if (await rYoutube.ready) {
            out = rYoutube;
          }
          while (isYoutube) {
            await Future.delayed(const Duration(microseconds: 500), () {});
          }
          isImage = true;
        }
        break;
      case StorageDir.repoSistem:
        {
          if (await rRepoSistem.ready) {
            out = rRepoSistem;
          }
          while (isRepoSistem) {
            await Future.delayed(const Duration(microseconds: 500), () {});
          }
          isImage = true;
        }
        break;

      default:
        {}
        break;
    }

    return out;
  }

  static void _exitArchive(String input) {
    switch (input) {
      case StorageDir.repoImage:
        {
          isImage = false;
        }
        break;
      case StorageDir.authUser:
        {
          isAuthUser = false;
        }
        break;
      case StorageDir.repoUser:
        {
          isUser = false;
        }
        break;
      case StorageDir.repoDataUser:
        {
          isDataUser = false;
        }
        break;
      case StorageDir.repoYoutube:
        {
          isYoutube = false;
        }
        break;
      case StorageDir.repoSistem:
        {
          isRepoSistem = false;
        }
        break;

      default:
        {}
        break;
    }
  }
}
