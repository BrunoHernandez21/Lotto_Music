// To parse this JSON data, do
//
//     final suscripcionResponse = suscripcionResponseFromMap(jsonString);

import 'dart:convert';

class SuscripcionResponse {
  SuscripcionResponse({
    this.mensaje,
    this.suscripcion,
  });

  final String? mensaje;
  final Suscripcion? suscripcion;

  factory SuscripcionResponse.fromJson(String str) =>
      SuscripcionResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SuscripcionResponse.fromMap(Map<String, dynamic> json) =>
      SuscripcionResponse(
        mensaje: json["mensaje"],
        suscripcion: json["suscripcion"] == null
            ? null
            : Suscripcion.fromMap(json["suscripcion"]),
      );

  Map<String, dynamic> toMap() => {
        "mensaje": mensaje,
        "suscripcion": suscripcion?.toMap(),
      };
}

class Suscripcion {
  Suscripcion({
    required this.montoMensual,
    this.fechaInicio,
    this.fechaFin,
    this.planId,
    required this.usuarioId,
    this.stripeCustomer,
    this.stripeSuscription,
    this.stripePayment,
  });

  final int montoMensual;
  final DateTime? fechaInicio;
  final DateTime? fechaFin;
  final int? planId;
  final int usuarioId;
  final String? stripeCustomer;
  final String? stripeSuscription;
  final String? stripePayment;

  factory Suscripcion.fromJson(String str) =>
      Suscripcion.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Suscripcion.fromMap(Map<String, dynamic> json) => Suscripcion(
        montoMensual: json["monto_mensual"],
        fechaInicio: DateTime.parse(json["fecha_inicio"]),
        fechaFin: DateTime.parse(json["fecha_fin"]),
        planId: json["plan_id"],
        usuarioId: json["usuario_id"],
        stripeCustomer: json["stripe_customer"],
        stripeSuscription: json["stripe_suscription"],
        stripePayment: json["stripe_payment"],
      );

  Map<String, dynamic> toMap() => {
        "monto_mensual": montoMensual,
        "fecha_inicio": fechaInicio?.toIso8601String(),
        "fecha_fin": fechaFin?.toIso8601String(),
        "plan_id": planId,
        "usuario_id": usuarioId,
        "stripe_customer": stripeCustomer,
        "stripe_suscription": stripeSuscription,
        "stripe_payment": stripePayment,
      };
}
