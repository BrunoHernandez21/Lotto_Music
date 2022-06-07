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
  static Widget parrafo({
    required String texto,
    TextAlign? align,
    int? renglones,
  }) =>
      _Base(
        color: const Color(0xFF000000),
        size: 14,
        text: texto,
        aling: align,
        renglones: renglones,
      );
  static Widget parrafoGrey({
    required String texto,
    TextAlign? align,
    int? renglones,
  }) =>
      _Base(
        color: const Color(0xFFADB0B3),
        size: 14,
        text: texto,
        aling: align,
        renglones: renglones,
      );
  static Widget parrafoNaranja({
    required String texto,
    TextAlign? align,
    int? renglones,
  }) =>
      _Base(
        color: const Color(0xFFF2BC3F),
        size: 19,
        text: texto,
        aling: align,
        renglones: renglones,
      );
  static Widget titulo(
          {required String texto,
          Color? color,
          TextAlign? align,
          int renglones = 1}) =>
      _Base(
        color: color ?? Colors.black,
        text: texto,
        size: 16,
        aling: align,
        renglones: renglones,
      );
  static Widget tituloNaranja({required String texto, TextAlign? align}) =>
      _Base(
        color: const Color(0xFFF2BC3F),
        size: 26,
        text: texto,
        aling: align,
      );
  static Widget tituloGrey(
          {required String texto, TextAlign? align, int renglones = 1}) =>
      _Base(
        color: const Color(0xFFADB0B3),
        size: 19,
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
