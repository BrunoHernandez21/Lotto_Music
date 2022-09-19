import 'package:bloc/bloc.dart';
import 'package:lotto_music/src/models/user/users.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserState()) {
    on<OnLoadUser>((event, emit) {
      emit(
        UserState(user: event.user),
      );
    });
  }
}
