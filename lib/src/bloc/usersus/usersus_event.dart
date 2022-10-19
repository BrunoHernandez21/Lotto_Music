part of 'usersus_bloc.dart';

@immutable
abstract class UsersusEvent {}

class OnLoadSuscribcion extends UsersusEvent {
  final Suscripcion? suscribcion;

  OnLoadSuscribcion({required this.suscribcion});
}
