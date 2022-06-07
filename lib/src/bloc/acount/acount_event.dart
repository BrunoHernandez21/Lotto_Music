part of 'acount_bloc.dart';

@immutable
abstract class AcountEvent {}

class OnLogin extends AcountEvent {
  final LoginResponse acount;
  final bool isLogin;
  OnLogin({required this.acount, this.isLogin = true});
}

class OnLogout extends AcountEvent {
  final LoginResponse acount = LoginResponse(validity: 0);
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
