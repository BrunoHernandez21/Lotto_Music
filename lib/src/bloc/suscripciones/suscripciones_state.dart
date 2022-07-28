part of 'suscripciones_bloc.dart';

@immutable
class SuscripcionesState {
  const SuscripcionesState({this.planes});
  final List<PlanModel>? planes;
}
