import 'package:flutter/material.dart';
import '../../helpers/variables_globales.dart';
import '../../widgets/list_videos.dart';
import 'appbar.dart';

class ProvedoresVideo extends StatelessWidget {
  const ProvedoresVideo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const AppbarInicio(),
          Expanded(
            child: ListVideos(
              loadVideos: () async {
                return Developer.videos;
              },
            ),
          ),
        ],
      )),
    );
  }
}
