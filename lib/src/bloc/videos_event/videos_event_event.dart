part of 'videos_event_bloc.dart';

@immutable
abstract class VideosEventEvent {}

class OnInitVideosEvent extends VideosEventEvent {
  final List<Item>? listado;
  final int pag;
  final int pags;
  final int sizePage;
  final int count;
  OnInitVideosEvent({
    required this.listado,
    required this.pag,
    required this.count,
    required this.pags,
    required this.sizePage,
  });
}

class OnLoadVideosEvent extends VideosEventEvent {
  final List<Item> listado;
  final int pag;
  OnLoadVideosEvent({
    required this.listado,
    required this.pag,
  });
}
