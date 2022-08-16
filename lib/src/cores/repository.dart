import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';

class Repository {
  static String? path;
  static String? temphat;

  static Future<void> _initialicePhat() async {
    path = (await getApplicationDocumentsDirectory()).path;
    if ((path?.endsWith('/') ?? true) == false) path = '${path!}/';
  }

  static Future<void> _initialiceTempPhat() async {
    temphat = (await getTemporaryDirectory()).path;
    if ((temphat?.endsWith('/') ?? true) == false) temphat = '${temphat!}/';
  }

  ////imagenes
  static Future<void> saveImage(String name, Uint8List bits) async {
    if (path == null) await _initialicePhat();
    if (path == null) return;
    final archivo = File(path! + name);
    final tumblari = File("${path!}tumb$name");
    if (await archivo.exists()) {
      archivo.deleteSync();
      tumblari.deleteSync();
    }
    archivo.createSync();
    tumblari.createSync();
    archivo.writeAsBytesSync(bits);
    final tumblary = await FlutterImageCompress.compressWithList(
      bits,
      minHeight: 480,
      minWidth: 360,
    );
    tumblari.writeAsBytesSync(tumblary);

    return;
  }

  static Future<File?> loadImage(String name) async {
    if (path == null) await _initialicePhat();
    final archivo = File(path! + name);
    if (archivo.existsSync()) {
      return archivo;
    }
    return null;
  }

  //// String
  static Future<String?> loadString(String name) async {
    if (path == null) await _initialicePhat();
    final archivo = File('${path!}$name.txt');
    if (!archivo.existsSync()) {
      return null;
    }
    return archivo.readAsStringSync();
  }

  static Future<void> saveString(String name, String data) async {
    if (path == null) await _initialicePhat();
    if (path == null) return;
    final archivo = File('${path!}$name.txt');
    if (archivo.existsSync()) archivo.deleteSync();
    archivo.createSync(recursive: true);
    archivo.writeAsStringSync(data);
  }

  //// doubles
  static Future<void> saveDouble(String name, double data) async {
    if (path == null) await _initialicePhat();
    if (path == null) return;
    final archivo = File('${path!}$name.txt');
    if (await archivo.exists()) {
      archivo.delete();
    }
    archivo.writeAsString(data.toString());
  }

  static Future<double?> loadDouble(String name, double data) async {
    if (path == null) await _initialicePhat();
    if (path == null) return null;
    final archivo = File('${path!}$name.txt');
    if (!archivo.existsSync()) {
      return null;
    }
    final info = archivo.readAsStringSync();
    return double.parse(info);
  }

  //// enteros
  static Future<void> saveInt(String name, int data) async {
    if (path == null) await _initialicePhat();
    if (path == null) return;
    final archivo = File('${path!}$name.txt');
    if (await archivo.exists()) {
      archivo.delete();
    }
    archivo.writeAsString(data.toString());
  }

  static Future<int?> loadInt(String name) async {
    if (path == null) await _initialicePhat();
    if (path == null) return null;
    final archivo = File('${path!}$name.txt');
    if (!archivo.existsSync()) {
      return null;
    }
    final info = archivo.readAsStringSync();
    return int.parse(info);
  }

  ////Bool
  static Future<void> saveBool(String name, bool data) async {
    if (path == null) await _initialicePhat();
    if (path == null) return;
    final archivo = File('${path!}$name.txt');
    if (await archivo.exists()) {
      archivo.delete();
    }
    archivo.writeAsString(data.toString());
  }

  static Future<bool?> loadBool(String name) async {
    if (path == null) await _initialicePhat();
    final archivo = File('${path!}$name.txt');
    if (!archivo.existsSync()) {
      return null;
    }
    final info = archivo.readAsStringSync();
    if (info == "true") return true;
    if (info == "false") return false;
    return null;
  }

  ////Temporal image
  static Future<String> saveTempImage(List<int> bits) async {
    if (temphat == null) await _initialiceTempPhat();
    final name =
        "temp${DateTime.now().toString().replaceAll(" ", "").replaceAll(".", "").replaceAll(":", "").replaceAll("-", "")}.jpg";
    final file = File(temphat! + name);
    file.writeAsBytesSync(bits);
    return name;
  }

  static Future<File?> loadTempImage(String name) async {
    if (temphat == null) await _initialiceTempPhat();
    final File archivo = File(temphat! + name);
    if (!archivo.existsSync()) {
      return null;
    }
    return archivo;
  }

  ////Flow control
  static deleteFromCahce(String name) async {
    if (temphat == null) await _initialiceTempPhat();
    final File archivo = File(temphat! + name);
    if (archivo.existsSync()) archivo.deleteSync();
  }

  static deleteFromDocuments(String name) async {
    if (path == null) await _initialicePhat();
    final File archivo = File(temphat! + name);
    if (archivo.existsSync()) archivo.deleteSync();
  }
}
