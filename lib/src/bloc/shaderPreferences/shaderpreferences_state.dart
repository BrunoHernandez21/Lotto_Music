part of 'shaderpreferences_bloc.dart';

@immutable
class ShaderpreferencesState {
  const ShaderpreferencesState({
    required this.themeData,
    required this.idioma,
  });

  final ThemeData themeData;
  final Locale idioma;

  ShaderpreferencesState copyWhit({
    ThemeData? themeData,
    Locale? idioma,
  }) =>
      ShaderpreferencesState(
        themeData: themeData ?? this.themeData,
        idioma: idioma ?? this.idioma,
      );
}
