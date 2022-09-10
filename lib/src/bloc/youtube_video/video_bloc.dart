import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/youtube.dart';

part 'video_event.dart';
part 'video_state.dart';

class YTVideoBloc extends Bloc<YTVideoEvent, YTVideoState> {
  YTVideoBloc() : super(const YTVideoState()) {
    on<OnSelectVideoYT>((event, emit) {
      emit(YTVideoState(eventoVideo: event.item));
    });
  }
}
