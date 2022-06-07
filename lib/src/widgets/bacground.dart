import 'package:lotto_music/src/helpers/variables_globales.dart';
import 'package:flutter/material.dart';

class BackGrounds {
  static Widget login({required Widget child}) => _Login(child: child);
  static Widget burbujas({required Widget child}) =>
      _CuadroBurbujas(child: child);
}

class _Login extends StatelessWidget {
  final Widget child;
  const _Login({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.blueGrey,
        ),
        //background
        Image.asset(
          Assets.rootpage,
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),

        //logo
        Center(
            child: Padding(
          padding: const EdgeInsets.only(bottom: 60.0),
          child: Image.asset(
            Assets.logo,
            height: Medidas.size.height * .42,
          ),
        )),
        child,
      ],
    );
  }
}

class _CuadroBurbujas extends StatelessWidget {
  final Widget child;
  const _CuadroBurbujas({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          Assets.bubbles,
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        child,
      ],
    );
  }
}
