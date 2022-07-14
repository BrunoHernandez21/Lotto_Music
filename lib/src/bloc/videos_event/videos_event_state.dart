part of 'videos_event_bloc.dart';

@immutable
class VideosEventState {
  const VideosEventState({
    required this.listado,
    required this.pag,
    required this.pags,
    this.sizePage = 10,
    required this.count,
  });
  final int pag;
  final int pags;
  final int sizePage;
  final int count;
  final List<ItemEvent>? listado;
  VideosEventState copyWith({
    int? pag,
    int? pags,
    int? sizePage,
    int? count,
    List<ItemEvent>? listado,
  }) =>
      VideosEventState(
        listado: listado ?? this.listado,
        count: count ?? this.count,
        pag: pag ?? this.pag,
        pags: pags ?? this.pags,
        sizePage: sizePage ?? this.sizePage,
      );
}
