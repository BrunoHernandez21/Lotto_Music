part of 'cartera_bloc.dart';

@immutable
abstract class CarteraEvent {}

class OnLoadCartera extends CarteraEvent {
  final CarteraModel cartera;

  OnLoadCartera({required this.cartera});
}
