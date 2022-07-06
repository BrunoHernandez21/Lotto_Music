import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lotto_music/src/helpers/variables_globales.dart';
import 'package:lotto_music/src/widgets/text.dart';

import '../../widgets/digital_clock.dart';
import 'oclock.dart';

class Clock extends StatefulWidget {
  static const String routeName = "clock";
  const Clock({Key? key}) : super(key: key);

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  DateTime initValue = DateTime(0);
  DateTime i = DateTime(0);
  bool isLive = true;
  late final Timer a;
  @override
  void initState() {
    initValue = DateTime(1, 1, 1, 0, 2, 0);
    i = initValue;
    a = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (i.hour <= 0 && i.minute <= 0 && i.second <= 0) {
        isLive = false;
        timer.cancel();
        setState(() {});
      } else {
        i = i.add(const Duration(seconds: -1));
        setState(() {});
      }
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
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 31, 49, 95),
      body: Stack(children: [
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Textos.tituloMED(
                texto: "Tiempo Restante",
                color: Colors.white,
              ),
              const SizedBox(height: 15),
              DigitalClock(tiempo: i),
              const SizedBox(height: 15),
              CustomPaint(
                painter: ShapesPainter(
                  time: DateTime(
                    1,
                    1,
                    0,
                    11 - i.hour,
                    59 - i.minute,
                    60 - i.second,
                  ),
                  isPaint: false,
                ),
                child: SizedBox(
                  height: Medidas.size.width * .6,
                  width: Medidas.size.width * .6,
                ),
              ),
              const SizedBox(height: 15),
              Textos.tituloMAX(texto: "\$30,000 mxn"),
              const SizedBox(height: 15),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: Medidas.size.width * .409,
                    height: Medidas.size.width * .23,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(
                      "https://www.menudospeques.net/images/musica/adele_Rolling_in_the_deep.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: Medidas.size.width * .23,
                    width: Medidas.size.width * .5,
                    child: ListTile(
                        title: Textos.tituloMED(
                          texto: "Rolling in the deep",
                          color: Colors.white,
                        ),
                        subtitle: Textos.parrafoMED(texto: "Adele")),
                  )
                ],
              )
            ],
          ),
        ),
      ]),
    );
  }
}
