part of 'acount_bloc.dart';

@immutable
class AcountState {
  const AcountState({
    required this.acount,
    required this.isLogin,
  });

  final LoginResponse acount;
  final bool isLogin;

  AcountState copyWith({
    LoginResponse? acount,
    bool? isLogin,
  }) =>
      AcountState(
        acount: acount ?? this.acount,
        isLogin: isLogin ?? this.isLogin,
      );

  factory AcountState.fromJson(String str) =>
      AcountState.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AcountState.fromMap(Map<String, dynamic> json) => AcountState(
        acount: LoginResponse.fromMap(json["acount"]),
        isLogin: json["isLogin"],
      );

  Map<String, dynamic> toMap() => {
        "acount": acount.toMap(),
        "isLogin": isLogin,
      };
}
