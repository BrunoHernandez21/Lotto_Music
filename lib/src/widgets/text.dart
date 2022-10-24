import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../helpers/globals/fonst.dart';

class Textos {
  static Widget desvanecido({required String texto}) => _Base(
        text: texto,
        fontsFamily: FontsFamily.roboto,
      );

  static Widget parrafoHiper({
    required String texto,
    required String hipertext,
    required void Function() onTap,
    TextAlign aling = TextAlign.center,
    double fontSize = 15,
    double fontHiperSize = 15,
    Color? colorTexto,
    Color colorHiperTexto = const Color(0xFFFB8853),
  }) =>
      _TextWhitHipertext(
        onTap: onTap,
        align: aling,
        colorHipertext: colorHiperTexto,
        hipertxt: hipertext,
        colorText: colorTexto,
        text: texto,
        fontSize: fontSize,
        fontHiperSize: fontHiperSize,
      );
  static Widget texto({
    FontWeight? fontWeight,
    required String texto,
    TextAlign? align,
    int? renglones,
    Color? color,
    double? size,
  }) =>
      _Base(
        fontWeight: fontWeight,
        color: color,
        size: size ?? 18,
        text: texto,
        aling: align,
        renglones: renglones,
        fontsFamily: FontsFamily.roboto,
      );

  static Widget parrafoMIN({
    FontWeight? fontWeight,
    required String texto,
    TextAlign? align,
    int? renglones,
    Color? color,
    double? size,
    String fontsFamily = FontsFamily.roboto,
  }) =>
      _Base(
        fontWeight: fontWeight,
        color: color,
        size: size ?? 14,
        text: texto,
        aling: align,
        renglones: renglones,
        fontsFamily: fontsFamily,
      );

  static Widget parrafoMED({
    FontWeight? fontWeight,
    required String texto,
    TextAlign? align,
    int? renglones,
    Color? color,
    double? size,
    String fontsFamily = FontsFamily.roboto,
  }) =>
      _Base(
        fontWeight: fontWeight,
        color: color,
        size: size ?? 16,
        text: texto,
        aling: align,
        renglones: renglones,
        fontsFamily: fontsFamily,
      );
  static Widget parrafoMAX({
    FontWeight? fontWeight,
    required String texto,
    TextAlign? align,
    int? renglones,
    Color? color,
    double? size,
    String fontsFamily = FontsFamily.roboto,
  }) =>
      _Base(
        fontWeight: fontWeight,
        color: color,
        size: size ?? 18,
        text: texto,
        aling: align,
        renglones: renglones,
        fontsFamily: fontsFamily,
      );

  static Widget tituloMIN({
    required String texto,
    TextAlign? align,
    int? renglones,
    Color? color,
    double? size,
    FontWeight? fontWeight,
    String fontsFamily = FontsFamily.roboto,
  }) =>
      _Base(
        fontWeight: fontWeight,
        color: color,
        size: size ?? 20,
        text: texto,
        aling: align,
        renglones: renglones,
        fontsFamily: fontsFamily,
      );

  static Widget tituloMED({
    required String texto,
    TextAlign? align,
    int? renglones,
    Color? color,
    double? size,
    FontWeight? fontWeight,
    String fontsFamily = FontsFamily.roboto,
  }) =>
      _Base(
        fontWeight: fontWeight,
        color: color,
        size: size ?? 22,
        text: texto,
        aling: align,
        renglones: renglones,
        fontsFamily: fontsFamily,
      );

  static Widget tituloMAX({
    required String texto,
    TextAlign? align,
    int? renglones,
    Color? color,
    double? size,
    FontWeight? fontWeight,
    String fontsFamily = FontsFamily.roboto,
  }) =>
      _Base(
        fontWeight: fontWeight,
        color: color,
        size: size ?? 26,
        text: texto,
        aling: align,
        renglones: renglones,
        fontsFamily: fontsFamily,
      );
}

class _Base extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;
  final TextAlign? aling;
  final int? renglones;
  final String fontsFamily;
  final FontWeight? fontWeight;
  const _Base({
    this.size = 24,
    required this.text,
    this.aling = TextAlign.left,
    this.color,
    this.renglones,
    this.fontWeight,
    required this.fontsFamily,
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
        fontFamily: fontsFamily,
        fontWeight: fontWeight,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class _TextWhitHipertext extends StatelessWidget {
  final String text;
  final Color? colorText;
  final String hipertxt;
  final Color colorHipertext;
  final void Function() onTap;
  final double fontSize;
  final double fontHiperSize;
  final TextAlign align;

  const _TextWhitHipertext(
      {required this.text,
      required this.hipertxt,
      required this.colorText,
      required this.colorHipertext,
      required this.onTap,
      required this.fontSize,
      required this.fontHiperSize,
      required this.align,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: align,
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
