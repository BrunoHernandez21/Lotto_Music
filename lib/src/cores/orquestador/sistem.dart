part of 'orquestador.dart';

class _Sistem {
  //////////////////////////////////////////////
  /// App state shader preferences
  Future<bool> onChagengeTheme(BuildContext context) async {
    final blocShader = BlocProvider.of<ShaderpreferencesBloc>(context);
    ThemeData myTheme;
    if (blocShader.state.themeData.backgroundColor !=
        ThemeData.dark().backgroundColor) {
      myTheme = ThemeData.dark().copyWith(
        backgroundColor: ThemeData.dark().backgroundColor,
        appBarTheme: ThemeData.dark().appBarTheme.copyWith(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
      );
    } else {
      myTheme = ThemeData.light().copyWith(
          backgroundColor: Colores.background,
          appBarTheme: ThemeData.light().appBarTheme.copyWith(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ));
    }
    blocShader.add(OnChageTheme(themeData: myTheme));
    return true;
  }

  /////////////////locale/////////////////////////////////////////////////

  final String _localeLanguageCodeKey = 'localeLanguajeCode';
  final String _localeCountyCodeKey = 'localeCountryCode';
  Future<void> saveLocale(Locale locale) async {
    Repository.saveString(_localeLanguageCodeKey, locale.languageCode);
    Repository.saveString(_localeCountyCodeKey, locale.countryCode ?? '');
  }

  Future<Locale> get locale async {
    String? code = await Repository.loadString(_localeLanguageCodeKey);
    if (code?.isEmpty ?? true) code = 'es';
    final String country =
        await Repository.loadString(_localeCountyCodeKey) ?? "";
    if (country.isEmpty) {
      return Locale(code!);
    } else {
      return Locale('${code!}_$country');
    }
  }

  /////////////////theme/////////////////////////////////////////////////

  Future<void> saveTheme(ThemeData theme) async {
    if (theme.backgroundColor == ThemeData.dark().backgroundColor) {
      Repository.saveInt('theme', 1);
    } else {
      Repository.saveInt('theme', 0);
    }
  }

  Future<ThemeData> get theme async {
    final int selector = await Repository.loadInt('theme') ?? 1;
    if (selector == 1) {
      ThemeData myTheme = ThemeData.dark().copyWith(
        backgroundColor: ThemeData.dark().backgroundColor,
        appBarTheme: ThemeData.dark().appBarTheme.copyWith(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
      );
      return myTheme;
    } else {
      ThemeData myTheme = ThemeData.light().copyWith(
          backgroundColor: Colores.background,
          appBarTheme: ThemeData.light().appBarTheme.copyWith(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ));
      return myTheme;
    }
  }

  /////////////////user/////////////////////////////////////////////////

  Future<void> saveLoginResponse({required LoginResponse acount}) async {
    Repository.saveString(StorageDir.authUser, acount.toJson());
  }

  Future<LoginResponse> loadLoginResponse() async => LoginResponse.fromJson(
        await Repository.loadString(StorageDir.authUser) ?? "{}",
      );

  /////////////////LOGIN/////////////////////////////////////////////////

  Future<void> saveisLogin(bool isLogin) async {
    Repository.saveBool('isLogin', isLogin);
  }

  Future<bool> get isLogin async {
    final bool isLogin = await Repository.loadBool('isLogin') ?? false;

    return isLogin;
  }
}
