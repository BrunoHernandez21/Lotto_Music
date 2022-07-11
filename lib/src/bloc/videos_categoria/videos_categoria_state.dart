part of 'videos_categoria_bloc.dart';

@immutable
class VideosCategoriaState {
  const VideosCategoriaState({
    required this.listado,
    required this.pag,
    required this.pags,
    this.sizePage = 10,
    required this.count,
    required this.categoria,
  });
  final int pag;
  final int pags;
  final int sizePage;
  final int count;
  final String categoria;
  final List<Item>? listado;
  VideosCategoriaState copyWith({
    int? pag,
    int? pags,
    int? sizePage,
    int? count,
    String? categoria,
    List<Item>? listado,
  }) =>
      VideosCategoriaState(
        listado: listado ?? this.listado,
        count: count ?? this.count,
        pag: pag ?? this.pag,
        pags: pags ?? this.pags,
        sizePage: sizePage ?? this.sizePage,
        categoria: categoria ?? this.categoria,
      );
}
