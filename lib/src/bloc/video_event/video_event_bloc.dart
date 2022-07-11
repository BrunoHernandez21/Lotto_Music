import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/evento.dart';
import '../../models/evento_video.dart';
import '../../models/videos.dart';

part 'video_event_event.dart';
part 'video_event_state.dart';

class VideoEventBloc extends Bloc<VideoEventEvent, VideoEventState> {
  VideoEventBloc()
      : super(VideoEventState(
            eventoVideo: Item(
          evento: EventoModel(),
          video: VideoModel(),
        ))) {
    on<OnSelectVideoEvent>((event, emit) {
      emit(VideoEventState(eventoVideo: event.eventoVideo));
    });
  }
}
