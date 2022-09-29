import 'dart:convert';

class OclockResponse {
  OclockResponse({
    this.time,
    this.mensaje,
  });

  DateTime? time;
  String? mensaje;

  OclockResponse copyWith({
    DateTime? time,
    String? mensaje,
  }) =>
      OclockResponse(
        time: time ?? this.time,
        mensaje: mensaje ?? this.mensaje,
      );

  factory OclockResponse.fromJson(String str) {
    try {
      return OclockResponse.fromMap(json.decode(str));
    } catch (e) {
      return OclockResponse(mensaje: "mensaje incomprensible");
    }
  }

  String toJson() => json.encode(toMap());

  factory OclockResponse.fromMap(Map<String, dynamic> json) => OclockResponse(
        time: json["time"] == null
            ? null
            : DateTime.parse(json["time"]).toLocal(),
        mensaje: json["mensaje"],
      );

  Map<String, dynamic> toMap() => {
        "time": time?.toIso8601String(),
        "mensaje": mensaje,
      };
}
