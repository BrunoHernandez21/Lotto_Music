import 'dart:convert';

class TarjetaModel {
  TarjetaModel({
    this.id = 0,
    this.activo = false,
    this.defaultPayment = false,
    this.cardNumber = "",
    this.cvc = 0,
    this.expiryMonth = 0,
    this.expiryYear = 0,
    this.holderName = '',
    this.type = "",
    this.usuarioId = 0,
    this.mensaje,
  });

  int id;
  bool activo;
  bool defaultPayment;
  String cardNumber;
  int cvc;
  int expiryMonth;
  int expiryYear;
  String holderName;
  String type;
  int usuarioId;
  String? mensaje;

  TarjetaModel copyWith(
          {int? id,
          bool? activo,
          bool? defaultPayment,
          String? cardNumber,
          int? cvc,
          int? expiryMonth,
          int? expiryYear,
          String? holderName,
          String? type,
          int? usuarioId,
          String? mensaje}) =>
      TarjetaModel(
        id: id ?? this.id,
        activo: activo ?? this.activo,
        defaultPayment: defaultPayment ?? this.defaultPayment,
        cardNumber: cardNumber ?? this.cardNumber,
        cvc: cvc ?? this.cvc,
        expiryMonth: expiryMonth ?? this.expiryMonth,
        expiryYear: expiryYear ?? this.expiryYear,
        holderName: holderName ?? this.holderName,
        type: type ?? this.type,
        usuarioId: usuarioId ?? this.usuarioId,
        mensaje: mensaje ?? this.mensaje,
      );

  factory TarjetaModel.fromJson(String str) {
    try {
      return TarjetaModel.fromMap(json.decode(str));
    } catch (e) {
      return TarjetaModel(mensaje: "mensaje incomprensible");
    }
  }

  String toJson() => json.encode(toMap());

  factory TarjetaModel.fromMap(Map<String, dynamic> json) => TarjetaModel(
        id: json["id"] ?? 0,
        activo: json["activo"] ?? false,
        defaultPayment: json["default_payment"] ?? false,
        cardNumber: json["card_number"] ?? "",
        cvc: json["cvc"] ?? 0,
        expiryMonth: json["expiry_month"] ?? 0,
        expiryYear: json["expiry_year"] ?? 0,
        holderName: json["holder_name"] ?? "",
        type: json["type"] ?? "",
        usuarioId: json["usuario_id"] ?? 0,
        mensaje: json["mensaje"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "activo": activo,
        "default_payment": defaultPayment,
        "card_number": cardNumber,
        "cvc": cvc,
        "expiry_month": expiryMonth,
        "expiry_year": expiryYear,
        "holder_name": holderName,
        "type": type,
        "usuario_id": usuarioId,
        "mensaje": mensaje,
      };
}
