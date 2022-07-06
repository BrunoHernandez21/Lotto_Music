import 'package:flutter/material.dart';
import 'package:lotto_music/src/helpers/variables_globales.dart';
import 'package:lotto_music/src/widgets/botones.dart';

import '../../widgets/digital_clock.dart';
import '../../widgets/list_videos.dart';
import '../clock/clock.dart';
import 'appbar.dart';

class Eventos extends StatelessWidget {
  const Eventos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const AppbarEventos(),
          SizedBox(
            height: Medidas.size.height * .07,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: lessbar(context),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListVideos(
              loadVideos: () async {
                return Developer.videos;
              },
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> lessbar(BuildContext context) {
    return [
      SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            width: Medidas.size.width * .2,
            child: Botones.degradedButton(
                body: const Icon(Icons.history),
                colors: const [Color(0xffFFBBBB), Color(0xffA9F1DF)],
                onTap: () {}),
          ),
        ),
      ),
      SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            width: Medidas.size.width * .4,
            child: Botones.degradedButton(
                body: const DefaultDigitalClock(),
                colors: const [Color(0xffA9F1DF), Color(0xffA9F1DF)],
                onTap: () {
                  Navigator.of(context).pushNamed(Clock.routeName);
                }),
          ),
        ),
      ),
      SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            width: Medidas.size.width * .2,
            child: Botones.degradedButton(
                body: const Icon(Icons.analytics),
                colors: const [Color(0xffA9F1DF), Color(0xffFFBBBB)],
                onTap: () {
                  Navigator.of(context).pushNamed(Clock.routeName);
                }),
          ),
        ),
      ),
    ];
  }
}
