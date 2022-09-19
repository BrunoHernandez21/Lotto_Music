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
}
