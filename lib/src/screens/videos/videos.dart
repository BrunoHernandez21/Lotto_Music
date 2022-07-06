import 'package:flutter/material.dart';
import 'package:lotto_music/src/helpers/variables_globales.dart';

import '../../widgets/list_videos.dart';
import 'appbar.dart';

class Videos extends StatelessWidget {
  static const routeName = 'videos';

  const Videos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppbarVideos(),
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
