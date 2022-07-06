// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.id = 0,
    this.activo = true,
    this.apellidom = "",
    this.apellidop = "",
    this.email = "",
    this.fechaNacimiento,
    this.nombre = "",
    this.telefono = "",
  });

  int id;
  bool activo;
  String apellidom;
  String apellidop;
  String email;
  DateTime? fechaNacimiento;
  String nombre;
  String telefono;

  User copyWith({
    int? id,
    bool? activo,
    String? apellidom,
    String? apellidop,
    String? email,
    DateTime? fechaNacimiento,
    String? nombre,
    String? password,
    String? telefono,
  }) =>
      User(
        id: id ?? this.id,
        activo: activo ?? this.activo,
        apellidom: apellidom ?? this.apellidom,
        apellidop: apellidop ?? this.apellidop,
        email: email ?? this.email,
        fechaNacimiento: fechaNacimiento ?? this.fechaNacimiento,
        nombre: nombre ?? this.nombre,
        telefono: telefono ?? this.telefono,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        activo: json["activo"],
        apellidom: json["apellidom"],
        apellidop: json["apellidop"],
        email: json["email"],
        fechaNacimiento: DateTime.parse(json["fecha_nacimiento"]),
        nombre: json["nombre"],
        telefono: json["telefono"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "activo": activo,
        "apellidom": apellidom,
        "apellidop": apellidop,
        "email": email,
        "fecha_nacimiento": fechaNacimiento?.toIso8601String(),
        "nombre": nombre,
        "telefono": telefono,
      };
}
