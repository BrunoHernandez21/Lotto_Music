import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/video/evento_video.dart';

part 'videos_categoria_event.dart';
part 'videos_categoria_state.dart';

class VideosCategoriaBloc
    extends Bloc<VideosCategoriaEvent, VideosCategoriaState> {
  VideosCategoriaBloc()
      : super(const VideosCategoriaState(
          categoria: "",
          count: 0,
          listado: null,
          pag: 0,
          pags: 0,
          sizePage: 10,
        )) {
    on<OnLoadVideosCategoria>((event, emit) {
      List<ItemEvent> listup = state.listado ?? [];
      listup.addAll(event.listado);
      emit(state.copyWith(
        listado: listup,
        pag: event.pag,
      ));
    });

    on<OnSelectCategoria>((event, emit) {
      emit(VideosCategoriaState(
        categoria: event.categoria,
        count: 0,
        listado: null,
        pag: 0,
        pags: 0,
        sizePage: 10,
      ));
    });

    on<OnInitVideosCategoria>((event, emit) {
      emit(state.copyWith(
        count: event.count,
        listado: event.listado,
        pag: event.pag,
        pags: event.pags,
      ));
    });
  }
}
