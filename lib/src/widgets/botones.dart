import 'package:lotto_music/src/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../helpers/variables_globales.dart';

class Botones {
  ///////////////////////////////
  static Widget solidTextButtonWhite({
    required String text,
    required void Function() onTap,
    Color? fontColor,
  }) =>
      _Solido(
        body: Text(
          text,
          style: TextStyle(
              color: fontColor ?? Colors.black,
              fontFamily: FontsFamily.roboto,
              fontSize: 16,
              fontWeight: FontWeight.w800),
        ),
        onTap: onTap,
        backgroundColor: Colors.white.withOpacity(0.2),
        borderColor: Colors.white,
        maxSize: Medidas.size.height * .08,
        minSize: Medidas.size.height * .06,
      );

  static Widget solidTextButton({
    required String text,
    required void Function() onTap,
    required Color? fontColor,
    Color borderColor = Colors.transparent,
    required Color backColor,
  }) =>
      _Solido(
        body: Text(
          text,
          style: TextStyle(
              color: fontColor ?? Colors.black,
              fontFamily: FontsFamily.roboto,
              fontSize: 16,
              fontWeight: FontWeight.w800),
        ),
        onTap: onTap,
        backgroundColor: backColor,
        borderColor: borderColor,
        maxSize: Medidas.size.height * .08,
        minSize: Medidas.size.height * .06,
      );

  //////////////////////////////////////////////
  static Widget solidnWhitSvg({
    required String svgAsset,
    required String titulo,
    required void Function() onTap,
    Color? fontColor,
  }) =>
      SizedBox(
        width: 150,
        child: _Solido(
          body: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                svgAsset,
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Textos.parrafoMED(texto: titulo),
              ),
            ],
          ),
          onTap: onTap,
          backgroundColor: Colors.transparent,
          borderColor: const Color(0xFFDEDEDE),
          maxSize: 45,
          minSize: 45,
        ),
      );

  ///////////////////////////////////////////
  static Widget degradedTextButtonOrange({
    required String text,
    required void Function() onTap,
  }) =>
      _Degradado(
        body: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: FontsFamily.roboto,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        onTap: onTap,
        border: false,
        borderColor: const Color(0xFFFA8046),
        colors: const [Color(0xFFFA8046), Color(0xFFF7A742)],
        maxSize: Medidas.size.height * .08,
        minSize: Medidas.size.height * .06,
      );

  ///////////////////////////////////////////
  static Widget degradedTextButton({
    required String text,
    Color textColor = Colors.white,
    required List<Color> colors,
    Color bordercolor = const Color(0xFFFA8046),
    required void Function() onTap,
  }) =>
      _Degradado(
        body: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontFamily: FontsFamily.roboto,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        onTap: onTap,
        border: false,
        borderColor: bordercolor,
        colors: colors,
        maxSize: Medidas.size.height * .08,
        minSize: Medidas.size.height * .06,
      );

  ///////////////////////////////////////////
  static Widget degradedButtonOrange({
    required Widget body,
    required void Function() onTap,
    double? height,
  }) =>
      _Degradado(
        body: body,
        onTap: onTap,
        border: false,
        borderColor: const Color(0xFFFA8046),
        colors: const [Color(0xFFFA8046), Color(0xFFF7A742)],
        maxSize: height ?? Medidas.size.height * .08,
        minSize: height ?? Medidas.size.height * .06,
      );

  ///////////////////////////////////////////
  static Widget degradedButton({
    required Widget body,
    required void Function() onTap,
    required List<Color> colors,
    Color borderColor = const Color(0xFFFA8046),
    double? height,
  }) =>
      _Degradado(
        body: body,
        onTap: onTap,
        border: false,
        borderColor: borderColor,
        colors: colors,
        maxSize: height ?? Medidas.size.height * .08,
        minSize: height ?? Medidas.size.height * .06,
      );
}

class _Solido extends StatelessWidget {
  final Widget body;
  final Color backgroundColor;
  final Color? borderColor;
  final double minSize;
  final double maxSize;
  final void Function() onTap;

  const _Solido({
    required this.body,
    required this.onTap,
    required this.backgroundColor,
    required this.borderColor,
    required this.maxSize,
    required this.minSize,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
            minimumSize: MaterialStateProperty.all<Size?>(Size(
              double.infinity,
              minSize,
            )),
            maximumSize: MaterialStateProperty.all<Size?>(Size(
              double.infinity,
              maxSize,
            )),
            shape: borderColor == null
                ? null
                : MaterialStateProperty.all<OutlinedBorder>(
                    BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                      side: BorderSide(
                        width: 0.5,
                        color: borderColor!,
                      ),
                    ),
                  ),
            backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
            elevation: MaterialStateProperty.all<double>(0)),
        child: body);
  }
}

class _Degradado extends StatelessWidget {
  final Widget body;
  final void Function() onTap;
  final bool border;
  final Color borderColor;
  final List<Color> colors;
  final double minSize;
  final double maxSize;
  const _Degradado({
    required this.body,
    required this.onTap,
    required this.minSize,
    required this.maxSize,
    required this.border,
    required this.borderColor,
    required this.colors,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final styleBorder = BorderSide(
      color: borderColor,
      style: BorderStyle.solid,
      width: 0.5,
    );
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: border
            ? Border(
                bottom: styleBorder,
                left: styleBorder,
                right: styleBorder,
                top: styleBorder,
              )
            : null,
        gradient: LinearGradient(
          colors: colors,
          begin: FractionalOffset.centerLeft,
          end: FractionalOffset.centerRight,
        ),
      ),
      child: ElevatedButton(
          onPressed: onTap,
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all<Size?>(Size(
                double.infinity,
                minSize,
              )),
              maximumSize: MaterialStateProperty.all<Size?>(
                Size(
                  double.infinity,
                  maxSize,
                ),
              ),
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.transparent),
              elevation: MaterialStateProperty.all<double>(0)),
          child: body),
    );
  }
}
