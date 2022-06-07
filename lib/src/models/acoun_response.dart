// To parse this JSON data, do
//
//     final usuarioResponse = usuarioResponseFromMap(jsonString);

import 'dart:convert';

class AcountResponse {
  AcountResponse({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.facebook,
    this.twitter,
    this.linkedin,
    this.biography,
    this.image,
    this.status,
  });

  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? facebook;
  String? twitter;
  String? linkedin;
  String? biography;
  String? image;
  String? status;

  AcountResponse copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? facebook,
    String? twitter,
    String? linkedin,
    String? biography,
    String? image,
    String? status,
  }) =>
      AcountResponse(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        facebook: facebook ?? this.facebook,
        twitter: twitter ?? this.twitter,
        linkedin: linkedin ?? this.linkedin,
        biography: biography ?? this.biography,
        image: image ?? this.image,
        status: status ?? this.status,
      );

  factory AcountResponse.fromJson(String str) =>
      AcountResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AcountResponse.fromMap(Map<String, dynamic> json) => AcountResponse(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        facebook: json["facebook"],
        twitter: json["twitter"],
        linkedin: json["linkedin"],
        biography: json["biography"],
        image: json["image"],
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "facebook": facebook,
        "twitter": twitter,
        "linkedin": linkedin,
        "biography": biography,
        "image": image,
        "status": status,
      };
}
