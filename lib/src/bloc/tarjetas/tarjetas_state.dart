part of 'tarjetas_bloc.dart';

@immutable
class TarjetasState {
  final TarjetasResponse? tarjetas;
  final TarjetaModel? selected;
  const TarjetasState({
    this.tarjetas,
    this.selected,
  });

  TarjetasState copyWhit({
    TarjetasResponse? tarjetas,
    TarjetaModel? selected,
  }) =>
      TarjetasState(
        tarjetas: tarjetas ?? this.tarjetas,
        selected: selected ?? this.selected,
      );
}
