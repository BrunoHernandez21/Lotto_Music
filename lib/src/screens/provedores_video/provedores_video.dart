import 'package:flutter/material.dart';
import '../../widgets/text.dart';
import 'appbar.dart';
import 'youtube/search/search.dart';
import 'youtube/videos/videos.dart';

class ProvedoresVideo extends StatelessWidget {
  const ProvedoresVideo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const AppbarInicio(),
          GestureDetector(
            child: Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 240, 240, 255),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const Icon(
                    Icons.search,
                    color: Color.fromARGB(255, 105, 102, 102),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Textos.parrafoMED(texto: "Busquedas"),
                ],
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(SearchVideosYT.routeName);
            },
          ),
          const Expanded(child: ListVideosYT()),
        ],
      )),
    );
  }
}
