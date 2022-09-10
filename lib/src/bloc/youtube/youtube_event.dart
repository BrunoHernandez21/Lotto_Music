part of 'youtube_bloc.dart';

@immutable
abstract class YoutubeEvent {}

class OnInitVideosYT extends YoutubeEvent {
  final YoutubeModel yt;
  OnInitVideosYT({required this.yt});
}
