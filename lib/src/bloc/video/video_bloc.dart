import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/youtube.dart';

part 'video_event.dart';
part 'video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  VideoBloc() : super(const VideoState()) {
    on<OnSelectVideoYT>((event, emit) {
      emit(VideoState(eventoVideo: event.item));
    });
  }
}
