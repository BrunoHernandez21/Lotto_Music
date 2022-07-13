part of 'videos_bloc.dart';

@immutable
class VideosState {
  const VideosState({
    this.yt,
  });
  final YoutubeModel? yt;
  VideosState copyWith({
    YoutubeModel? yt,
  }) =>
      VideosState(
        yt: yt ?? this.yt,
      );
}
