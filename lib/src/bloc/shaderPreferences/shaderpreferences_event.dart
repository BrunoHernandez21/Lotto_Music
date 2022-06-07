part of 'shaderpreferences_bloc.dart';

@immutable
abstract class ShaderpreferencesEvent {}

class OnChageLocale extends ShaderpreferencesEvent {
  final Locale idioma;
  OnChageLocale({required this.idioma});
}

class OnChageTheme extends ShaderpreferencesEvent {
  final ThemeData themeData;
  OnChageTheme({required this.themeData});
}

class OnLoadShaderPreferences extends ShaderpreferencesEvent {
  final ThemeData themeData;
  final Locale idioma;

  OnLoadShaderPreferences({
    required this.idioma,
    required this.themeData,
  });
}
