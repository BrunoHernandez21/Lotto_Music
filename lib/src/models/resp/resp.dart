import 'dart:convert';

class SimpleResponse {
  SimpleResponse({
    this.resp,
    this.mensaje,
  });

  String? resp;
  String? mensaje;

  SimpleResponse copyWith({
    String? resp,
    String? mensaje,
  }) =>
      SimpleResponse(
        resp: resp ?? this.resp,
        mensaje: mensaje ?? this.mensaje,
      );

  factory SimpleResponse.fromJson(String str) {
    try {
      return SimpleResponse.fromMap(json.decode(str));
    } catch (e) {
      return SimpleResponse(mensaje: "mensaje incomprensible");
    }
  }

  String toJson() => json.encode(toMap());

  factory SimpleResponse.fromMap(Map<String, dynamic> json) => SimpleResponse(
        resp: json["resp"],
        mensaje: json["mensaje"],
      );

  Map<String, dynamic> toMap() => {
        "resp": resp,
        "mensaje": mensaje,
      };
}
