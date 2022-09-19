part of 'shaderpreferences_bloc.dart';

@immutable
class ShaderpreferencesState {
  const ShaderpreferencesState({
    required this.themeData,
    required this.idioma,
    this.recuerdame = true,
  });

  final ThemeData themeData;
  final Locale idioma;
  final bool recuerdame;

  ShaderpreferencesState copyWhit({
    ThemeData? themeData,
    Locale? idioma,
    bool? recuerdame,
  }) =>
      ShaderpreferencesState(
        themeData: themeData ?? this.themeData,
        idioma: idioma ?? this.idioma,
        recuerdame: recuerdame ?? this.recuerdame,
      );
}
