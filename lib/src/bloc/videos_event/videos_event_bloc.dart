import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import '../../models/video/evento_video.dart';

part 'videos_event_event.dart';
part 'videos_event_state.dart';

class VideosEventBloc extends Bloc<VideosEventEvent, VideosEventState> {
  VideosEventBloc()
      : super(
          const VideosEventState(
            count: 0,
            listado: null,
            pag: 0,
            pags: 0,
            sizePage: 10,
          ),
        ) {
    on<OnLoadVideosEvent>((event, emit) {
      final List<ItemEvent> listup = state.listado ?? [];
      listup.addAll(event.listado);
      emit(state.copyWith(
        listado: listup,
        pag: event.pag,
      ));
    });

    on<OnInitVideosEvent>((event, emit) {
      emit(VideosEventState(
        count: event.count,
        listado: event.listado,
        pag: event.pag,
        pags: event.pags,
      ));
    });
  }
}
