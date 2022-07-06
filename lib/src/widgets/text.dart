import 'package:lotto_music/src/helpers/variables_globales.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Textos {
  static Widget desvanecido({required String texto}) => _Base(
        text: texto,
      );

  static Widget parrafoHiper({
    required String texto,
    required String hipertext,
    double fontSize = 15,
    double fontHiperSize = 15,
    Color colorTexto = const Color(0xFFADB0B3),
    Color colorHiperTexto = const Color(0xFFFB8853),
    required void Function() onTap,
  }) =>
      _TextWhitHipertext(
        onTap: onTap,
        colorHipertext: colorHiperTexto,
        hipertxt: hipertext,
        colorText: colorTexto,
        text: texto,
        fontSize: fontSize,
        fontHiperSize: fontHiperSize,
      );
  static Widget texto({
    required String texto,
    TextAlign? align,
    int? renglones,
    Color? color,
    double? size,
  }) =>
      _Base(
        color: color ?? Colors.black,
        size: size ?? 14,
        text: texto,
        aling: align,
        renglones: renglones,
      );

  static Widget parrafoMIN({
    required String texto,
    TextAlign? align,
    int? renglones,
    Color? color,
    double? size,
  }) =>
      _Base(
        color: color ?? const Color(0xFFADB0B3),
        size: size ?? 12,
        text: texto,
        aling: align,
        renglones: renglones,
      );

  static Widget parrafoMED({
    required String texto,
    TextAlign? align,
    int? renglones,
    Color? color,
    double? size,
  }) =>
      _Base(
        color: color ?? const Color(0xFFADB0B3),
        size: size ?? 14,
        text: texto,
        aling: align,
        renglones: renglones,
      );
  static Widget parrafoMAX({
    required String texto,
    TextAlign? align,
    int? renglones,
    Color? color,
    double? size,
  }) =>
      _Base(
        color: color ?? const Color(0xFFADB0B3),
        size: size ?? 16,
        text: texto,
        aling: align,
        renglones: renglones,
      );

  static Widget tituloMIN({
    required String texto,
    TextAlign? align,
    int? renglones,
    Color? color,
    double? size,
  }) =>
      _Base(
        color: color ?? const Color(0xFFADB0B3),
        size: size ?? 18,
        text: texto,
        aling: align,
        renglones: renglones,
      );

  static Widget tituloMED({
    required String texto,
    TextAlign? align,
    int? renglones,
    Color? color,
    double? size,
  }) =>
      _Base(
        color: color ?? const Color(0xFFADB0B3),
        size: size ?? 22,
        text: texto,
        aling: align,
        renglones: renglones,
      );

  static Widget tituloMAX({
    required String texto,
    TextAlign? align,
    int? renglones,
    Color? color,
    double? size,
  }) =>
      _Base(
        color: color ?? const Color(0xFFF2BC3F),
        size: size ?? 24,
        text: texto,
        aling: align,
        renglones: renglones,
      );
}

class _Base extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;
  final TextAlign? aling;
  final int? renglones;
  const _Base({
    this.size = 20,
    required this.text,
    this.aling = TextAlign.left,
    this.color,
    this.renglones,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: renglones,
      textAlign: aling,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontFamily: FontsFamily.roboto,
      ),
    );
  }
}

class _TextWhitHipertext extends StatelessWidget {
  final String text;
  final Color colorText;
  final String hipertxt;
  final Color colorHipertext;
  final void Function() onTap;
  final double fontSize;
  final double fontHiperSize;

  const _TextWhitHipertext(
      {required this.text,
      required this.hipertxt,
      required this.colorText,
      required this.colorHipertext,
      required this.onTap,
      required this.fontSize,
      required this.fontHiperSize,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: TextStyle(
          color: colorText,
          fontSize: fontSize,
        ),
        children: <TextSpan>[
          TextSpan(
            recognizer: LongPressGestureRecognizer(
                duration: const Duration(microseconds: 1))
              ..onLongPress = onTap,
            text: hipertxt,
            style: TextStyle(
              color: colorHipertext,
              fontSize: fontHiperSize,
            ),
          ),
        ],
      ),
    );
  }
}
