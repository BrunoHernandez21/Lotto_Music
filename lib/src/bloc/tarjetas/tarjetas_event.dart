part of 'tarjetas_bloc.dart';

@immutable
abstract class TarjetasEvent {}

class OnLoadTarjetas extends TarjetasEvent {
  final TarjetasResponse? tarjetas;
  OnLoadTarjetas({required this.tarjetas});
}

class OnSelectTarjetas extends TarjetasEvent {
  final TarjetaModel? selected;
  OnSelectTarjetas({required this.selected});
}
