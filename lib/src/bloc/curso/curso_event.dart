part of 'curso_bloc.dart';

@immutable
abstract class CursoEvent {}

class OnBuy extends CursoEvent {
  final bool isBuy;
  OnBuy({
    required this.isBuy,
  });
}
