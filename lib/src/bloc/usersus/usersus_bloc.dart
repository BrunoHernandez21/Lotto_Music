import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/user/suscripcion.dart';

part 'usersus_event.dart';
part 'usersus_state.dart';

class UsersusBloc extends Bloc<UsersusEvent, UsersusState> {
  UsersusBloc() : super(const UsersusState()) {
    on<OnLoadSuscribcion>((event, emit) {
      emit(UsersusState(
        suscribcion: event.suscribcion,
      ));
    });
  }
}
