part of 'planes_bloc.dart';

@immutable
abstract class PlanesEvent {}

class OnLoadPlanes extends PlanesEvent {
  OnLoadPlanes({this.planes});
  final List<PlanModel>? planes;
}
