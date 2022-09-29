// To parse this JSON data, do
//
//     final userModel = userModelFromMap(jsonString);
import 'package:intl/intl.dart';
import 'dart:convert';

class UserModel {
  UserModel({
    this.id = 0,
    this.activo = true,
    this.apellidom,
    this.apellidop,
    this.email = "",
    this.fechaNacimiento,
    this.nombre,
    this.password = "",
    this.telefono,
    this.mensaje,
  });

  int id;
  bool activo;
  String? apellidom;
  String? apellidop;
  String email;
  DateTime? fechaNacimiento;
  String? nombre;
  String password;
  String? telefono;
  String? mensaje;

  UserModel copyWith({
    int? id,
    bool? activo,
    String? apellidom,
    String? apellidop,
    String? email,
    DateTime? fechaNacimiento,
    String? nombre,
    String? password,
    String? telefono,
    String? mensaje,
  }) =>
      UserModel(
        id: id ?? this.id,
        activo: activo ?? this.activo,
        apellidom: apellidom ?? this.apellidom,
        apellidop: apellidop ?? this.apellidop,
        email: email ?? this.email,
        fechaNacimiento: fechaNacimiento ?? this.fechaNacimiento,
        nombre: nombre ?? this.nombre,
        password: password ?? this.password,
        telefono: telefono ?? this.telefono,
        mensaje: mensaje ?? this.mensaje,
      );

  factory UserModel.fromJson(String str) {
    try {
      return UserModel.fromMap(json.decode(str));
    } catch (e) {
      return UserModel(mensaje: "mensaje incomprensible");
    }
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        id: json["id"] ?? 0,
        activo: json["activo"] ?? false,
        apellidom: json["apellidom"],
        apellidop: json["apellidop"],
        email: json["email"] ?? "",
        fechaNacimiento: json["fecha_nacimiento"] == null
            ? null
            : DateTime.parse(json["fecha_nacimiento"]).toLocal(),
        nombre: json["nombre"],
        password: json["password"] ?? "",
        telefono: json["telefono"],
        mensaje: json["mensaje"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "activo": activo,
        "apellidom": apellidom,
        "apellidop": apellidop,
        "email": email,
        "fecha_nacimiento": fechaNacimiento == null
            ? null
            : DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
                .format(fechaNacimiento!),
        "nombre": nombre,
        "password": password,
        "telefono": telefono,
        "mensaje": mensaje,
      };
}
