part of 'video_event_bloc.dart';

@immutable
abstract class VideoEventEvent {}

class OnSelectVideoEvent extends VideoEventEvent {
  final Item eventoVideo;
  OnSelectVideoEvent({
    required this.eventoVideo,
  });
}
