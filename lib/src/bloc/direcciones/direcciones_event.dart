part of 'direcciones_bloc.dart';

@immutable
abstract class DireccionesEvent {}

class OnLoadDirecciones extends DireccionesEvent {
  final DireccionesResponse? direcciones;
  OnLoadDirecciones({required this.direcciones});
}

class OnSelectDireccion extends DireccionesEvent {
  final DireccionesModel? selected;
  OnSelectDireccion({required this.selected});
}
