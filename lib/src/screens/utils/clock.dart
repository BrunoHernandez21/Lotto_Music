import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotto_music/src/helpers/rutinas.dart';
import 'package:lotto_music/src/widgets/text.dart';

import '../../bloc/videos_event/videos_event_bloc.dart';
import '../../helpers/globals/screen_size.dart';
import '../../widgets/digital_clock.dart';
import '../../widgets/oclock.dart';

class Clock extends StatelessWidget {
  static const String routeName = "clock";

  const Clock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 31, 49, 95),
      body: Stack(children: [
        BlocBuilder<VideosEventBloc, VideosEventState>(
          builder: (context, state) {
            final select = Rutinas.firstWhere(state.listado);
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 25,
                      width: double.infinity,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              size: 18,
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                      width: double.infinity,
                    ),
                    Textos.tituloMED(
                      texto: "Tiempo Restante",
                      color: Colors.white,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    _ClockController(
                        toEvent: select?.fechahoraevento?.minute ?? 0),
                    const SizedBox(height: 15),
                    Textos.tituloMAX(
                        texto:
                            "\$ ${(select?.premioCash.toString() ?? "").replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')} MXN"),
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
                            select?.thumblary ??
                                "https://t3.ftcdn.net/jpg/04/34/72/82/360_F_434728286_OWQQvAFoXZLdGHlObozsolNeuSxhpr84.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: Medidas.size.width * .23,
                          width: Medidas.size.width * .5,
                          child: ListTile(
                              title: Textos.tituloMED(
                                texto: select?.titulo ?? "",
                                color: Colors.white,
                              ),
                              subtitle: Textos.parrafoMED(
                                  texto: select?.artista ?? "")),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ]),
    );
  }
}

class _ClockController extends StatefulWidget {
  final int toEvent;
  const _ClockController({Key? key, required this.toEvent}) : super(key: key);

  @override
  State<_ClockController> createState() => __ClockControllerState();
}

class __ClockControllerState extends State<_ClockController> {
  DateTime i = DateTime.now();
  late final Timer a;
  @override
  void initState() {
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
    return Column(
      children: [
        DigitalClock(tiempo: i),
        const SizedBox(height: 15),
        CustomPaint(
          painter: ShapesPainter(time: i, isPaint: false, minuto: 30),
          child: SizedBox(
            height: Medidas.size.width * .6,
            width: Medidas.size.width * .6,
          ),
        ),
      ],
    );
  }
}
