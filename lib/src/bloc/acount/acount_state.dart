part of 'acount_bloc.dart';

@immutable
class AcountState {
  final LoginResponse acount;
  final bool isLogin;
  const AcountState({
    required this.acount,
    required this.isLogin,
  });

  AcountState copyWith({
    LoginResponse? acount,
    bool? isLogin,
  }) =>
      AcountState(
        acount: acount ?? this.acount,
        isLogin: isLogin ?? this.isLogin,
      );
}
