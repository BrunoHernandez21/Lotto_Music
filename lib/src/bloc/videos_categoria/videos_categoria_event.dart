part of 'videos_categoria_bloc.dart';

@immutable
abstract class VideosCategoriaEvent {}

class OnInitVideosCategoria extends VideosCategoriaEvent {
  final List<Item>? listado;
  final int pag;
  final int pags;
  final int sizePage;
  final int count;
  OnInitVideosCategoria({
    required this.listado,
    required this.pag,
    required this.count,
    required this.pags,
    required this.sizePage,
  });
}

class OnLoadVideosCategoria extends VideosCategoriaEvent {
  final List<Item> listado;
  final int pag;
  OnLoadVideosCategoria({
    required this.listado,
    required this.pag,
  });
}

class OnSelectCategoria extends VideosCategoriaEvent {
  final String categoria;
  OnSelectCategoria({
    required this.categoria,
  });
}
