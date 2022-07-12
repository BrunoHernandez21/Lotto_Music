part of 'user_bloc.dart';

@immutable
class UserState {
  final UserModel? user;
  const UserState({
    this.user,
  });

  UserState copyWhit(UserModel? user) {
    return UserState(
      user: user ?? this.user,
    );
  }
}
