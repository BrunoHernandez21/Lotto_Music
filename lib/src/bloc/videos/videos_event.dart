part of 'videos_bloc.dart';

@immutable
abstract class VideosEvent {}

class OnInitVideosYT extends VideosEvent {
  final YoutubeModel yt;
  OnInitVideosYT({required this.yt});
}
