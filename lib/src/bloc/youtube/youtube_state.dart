part of 'youtube_bloc.dart';

@immutable
class YoutubeState {
  const YoutubeState({
    this.yt,
  });
  final YoutubeModel? yt;
  YoutubeState copyWith({
    YoutubeModel? yt,
  }) =>
      YoutubeState(
        yt: yt ?? this.yt,
      );
}
