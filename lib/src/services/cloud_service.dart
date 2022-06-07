import 'dart:async';

// ignore: unused_import
import 'package:http/http.dart' as http;

class CloudService {
  static Future<dynamic> loadCloud() async {}

  static Future<dynamic> createService() async {}

  static Future<dynamic> saveChanges() async {}

  // ignore: unused_element
  static Future<dynamic> _imageSave(String uri, String token) async {
    /*
    if (uri.startsWith("temp") || uri.startsWith("local")) {
      final filepath = await Repository.loadTempImage(uri);
      if (filepath == null) return uri;

      final url = Uri.parse(_baseClud + "usuarios");
      final imageUploadRequest = http.MultipartRequest('POST', url);
      final file = await http.MultipartFile.fromPath('file', filepath.path);
      imageUploadRequest.files.add(file);
      imageUploadRequest.headers.addAll({
        "token": token,
      });
      final streamResponse = await imageUploadRequest.send();
      final resp = await http.Response.fromStream(streamResponse);
      final decodificado = json.decode(resp.body);
      String path = decodificado["filename"]?.substring(19).toString() ?? "";
      if (uri.startsWith("temp")) {
        await ImageRepository.moveCacheToDocuments(oldName: uri, newName: path);
      }
      if (uri.startsWith("local")) {
        await ImageRepository.removeFromExternal(uri);
      }
      return path;
    }
    return uri;*/
  }

  static Future<bool> removeElement() async {
    return true;
  }

  static Future<dynamic> getListType() async {}

  static Future<dynamic> getTypeName(String name) async {}

  static Future<dynamic> search() async {
    return null;
  }

  static Future<dynamic> downloadImage(String token) async {}
}
