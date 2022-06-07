import 'package:flutter/material.dart';

import '../helpers/variables_globales.dart';

class TitleLess extends StatelessWidget {
  final String title;
  const TitleLess({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 10),
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          fontFamily: FontsFamily.roboto,
          fontSize: 18,
        ),
      ),
    );
  }
}

class TitleFull extends StatelessWidget {
  final String title;
  const TitleFull({
    Key? key,
    required this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      alignment: Alignment.center,
      child: Text(
        title,
        style: const TextStyle(
          fontFamily: FontsFamily.roboto,
          fontSize: 20,
        ),
      ),
    );
  }
}
