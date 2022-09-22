part of 'orquestador.dart';

class _Sistem {
  ///////////////// ShaderPreferences
  /// Locale
  Future<bool> saveShaderLocale(ShaderpreferencesState state) async {
    return await Repository.saveString(StorageDir.repoSistem, state.toJson());
  }

  Future<ShaderpreferencesState> loadShaderLocale() async {
    final a = await Repository.loadString(StorageDir.repoSistem);
    if (a == null) {
      return ShaderpreferencesState(
        idioma: "es",
        isDarkTheme: false,
        recuerdame: true,
      );
    }
    try {
      final b = ShaderpreferencesState.fromJson(a);
      return b;
    } catch (e) {
      return ShaderpreferencesState(
        idioma: "es",
        isDarkTheme: false,
        recuerdame: true,
      );
    }
  }

  /// chage theme
  Future<bool> onChagengeTheme(BuildContext context) async {
    final blocShader = BlocProvider.of<ShaderpreferencesBloc>(context);
    blocShader.add(OnChageTheme(isDarkTheme: !blocShader.state.isDarkTheme));
    return true;
  }

  /////////////////user/////////////////////////////////////////////////
  ///////////////// ShaderPreferences
  /// Locale
  Future<bool> saveAuthLocale(AcountState state) async {
    return await Repository.saveString(StorageDir.authUser, state.toJson());
  }

  Future<AcountState> loadAuthLocale() async {
    final a = await Repository.loadString(StorageDir.authUser);
    if (a == null) {
      return AcountState(
        acount: LoginResponse(),
        isLogin: false,
      );
    }
    try {
      final b = AcountState.fromJson(a);
      return b;
    } catch (e) {
      return AcountState(
        acount: LoginResponse(),
        isLogin: false,
      );
    }
  }
}
