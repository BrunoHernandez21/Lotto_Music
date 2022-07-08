part of 'acount_bloc.dart';

@immutable
abstract class AcountEvent {}

class OnLogin extends AcountEvent {
  final LoginResponse response;
  OnLogin({required this.response});
}

class OnLogout extends AcountEvent {
  final LoginResponse acount = LoginResponse(
    accessToken: "",
    expiresIn: null,
    tokenType: "",
  );
  final bool isLogin = false;
}

class OnEditalbe extends AcountEvent {
  OnEditalbe({required this.editable});
  final bool editable;
}

class OnUpdateAcount extends AcountEvent {
  OnUpdateAcount({required this.acount});
  final LoginResponse acount;
}
