part of 'direcciones_bloc.dart';

@immutable
class DireccionesState {
  final DireccionesResponse? direcciones;
  final DireccionesModel? selected;
  const DireccionesState({
    this.direcciones,
    this.selected,
  });

  DireccionesState copyWhit({
    DireccionesResponse? direcciones,
    DireccionesModel? selected,
  }) =>
      DireccionesState(
        direcciones: direcciones ?? this.direcciones,
        selected: selected ?? this.selected,
      );
}
