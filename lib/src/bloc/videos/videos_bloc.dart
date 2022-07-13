import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/youtube.dart';

part 'videos_event.dart';
part 'videos_state.dart';

class VideosBloc extends Bloc<VideosEvent, VideosState> {
  VideosBloc() : super(const VideosState()) {
    on<OnInitVideosYT>((event, emit) {
      emit(VideosState(yt: event.yt));
    });
  }
}
