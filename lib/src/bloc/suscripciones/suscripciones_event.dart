part of 'suscripciones_bloc.dart';

@immutable
abstract class PlanesEvent {}

class OnLoadSuscripciones extends PlanesEvent {
  OnLoadSuscripciones({this.planes});
  final List<PlanModel>? planes;
}
