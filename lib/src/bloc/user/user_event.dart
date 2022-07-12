part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class OnLoadUser extends UserEvent {
  final UserModel user;
  OnLoadUser({
    required this.user,
  });
}
