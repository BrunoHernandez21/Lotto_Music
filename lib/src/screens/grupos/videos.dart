import 'package:flutter/material.dart';
import 'package:lotto_music/src/widgets/list_videos.dart';

import '../../helpers/variables_globales.dart';

class VideosApuestas extends StatelessWidget {
  const VideosApuestas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListVideos(
                loadVideos: () async {
                  return Developer.videos;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
