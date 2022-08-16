part of 'estadisticas_bloc.dart';

@immutable
abstract class EstadisticasEvent {}

class OnUpdateStadistics extends EstadisticasEvent {
  final StadisticsResponse response;

  OnUpdateStadistics({required this.response});
}
