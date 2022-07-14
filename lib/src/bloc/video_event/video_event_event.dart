part of 'video_event_bloc.dart';

@immutable
abstract class VideoEventEvent {}

class OnSelectVideoEvent extends VideoEventEvent {
  final ItemEvent eventoVideo;
  OnSelectVideoEvent({
    required this.eventoVideo,
  });
}
