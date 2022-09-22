import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';

class FileRepository {
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
