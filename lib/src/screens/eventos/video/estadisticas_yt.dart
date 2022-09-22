import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/stadistics/estadisticas_bloc.dart';
import '../../../models/video/stadistics_model.dart';
import '../../../widgets/text.dart';

///Estadisticas

class EstadisticasYT extends StatelessWidget {
  final int videoID;

  const EstadisticasYT({Key? key, required this.videoID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EstadisticasBloc, EstadisticasState>(
      builder: (context, state) {
        StadisticModel st = StadisticModel();
        final len = state.allStadistics?.stadisticModel?.length;

        for (int i = (len ?? 0) - 1; i >= 0; i--) {
          if (state.allStadistics?.stadisticModel?[i].videoId == videoID) {
            st = state.allStadistics?.stadisticModel?[i] ?? StadisticModel();
            break;
          }
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Textos.parrafoMAX(
              texto:
                  "Vistas: ${(st.viewCount?.toString() ?? "").replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}",
            ),
            Textos.parrafoMAX(
              texto:
                  "Me gusta: ${(st.likeCount?.toString() ?? "").replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}",
            ),
            Textos.parrafoMAX(
              texto:
                  "Comentarios: ${(st.commentsCount?.toString() ?? "").replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}",
            ),
          ],
        );
      },
    );
  }
}
