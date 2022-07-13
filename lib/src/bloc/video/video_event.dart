part of 'video_bloc.dart';

@immutable
abstract class VideoEvent {}

class OnSelectVideoYT extends VideoEvent {
  final ItemYT item;
  OnSelectVideoYT({
    required this.item,
  });
}
