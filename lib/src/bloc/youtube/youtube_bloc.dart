import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/youtube/youtube.dart';

part 'youtube_event.dart';
part 'youtube_state.dart';

class YoutubeBloc extends Bloc<YoutubeEvent, YoutubeState> {
  YoutubeBloc() : super(const YoutubeState()) {
    on<OnInitVideosYT>((event, emit) {
      emit(YoutubeState(yt: event.yt));
    });
  }
}
