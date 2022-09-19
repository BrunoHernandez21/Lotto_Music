import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../cores/acount.dart';
import '../../models/auth/login_response.dart';

part 'acount_event.dart';
part 'acount_state.dart';

class AcountBloc extends Bloc<AcountEvent, AcountState> {
  AcountBloc({required LoginResponse acount, required bool isLogin})
      : super(AcountState(
          acount: acount,
          isLogin: isLogin,
        )) {
    on<OnLogin>((event, emit) =>
        emit(AcountState(acount: event.response, isLogin: true)));
    on<OnLogout>((event, emit) =>
        emit(AcountState(acount: event.acount, isLogin: false)));
    on<OnUpdateAcount>(
        (event, emit) => emit(state.copyWith(acount: state.acount)));
  }

  //////////////////////////////////////////////////Cerrar secion
  Future<LoginResponse> logout() async {
    add(OnLogout());
    AcountLocalSave.saveisLogin(false);
    final acount =
        LoginResponse(accessToken: "", expiresIn: null, tokenType: "");
    AcountLocalSave.saveLoginResponse(acount: acount);

    return acount;
  }
}
