part of 'video_bloc.dart';

@immutable
abstract class YTVideoEvent {}

class OnSelectVideoYT extends YTVideoEvent {
  final ItemYT item;
  OnSelectVideoYT({
    required this.item,
  });
}
