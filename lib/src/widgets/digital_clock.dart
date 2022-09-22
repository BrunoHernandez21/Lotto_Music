import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lotto_music/src/widgets/text.dart';

class DigitalClock extends StatefulWidget {
  final DateTime tiempo;
  const DigitalClock({Key? key, required this.tiempo}) : super(key: key);

  @override
  State<DigitalClock> createState() => DigitalClockState();
}

class DigitalClockState extends State<DigitalClock> {
  DateTime i = DateTime(0);
  @override
  Widget build(BuildContext context) {
    return Textos.tituloMED(
      texto: widget.tiempo.toString().substring(11, 19),
      color: Colors.black,
    );
  }
}

class DefaultDigitalClock extends StatefulWidget {
  final DateTime? fecha;
  const DefaultDigitalClock({Key? key, this.fecha}) : super(key: key);

  @override
  State<DefaultDigitalClock> createState() => _DefaultDigitalClockState();
}

class _DefaultDigitalClockState extends State<DefaultDigitalClock> {
  DateTime i = DateTime(0);
  bool isLive = true;
  late final Timer a;
  @override
  void initState() {
    i = widget.fecha ?? DateTime.now();
    a = Timer.periodic(const Duration(seconds: 1), (timer) {
      i = i.add(const Duration(seconds: 1));
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    a.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DigitalClock(tiempo: i);
  }
}
