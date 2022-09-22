part of 'shaderpreferences_bloc.dart';

@immutable
abstract class ShaderpreferencesEvent {}

class OnChageLocale extends ShaderpreferencesEvent {
  final String idioma;
  OnChageLocale({required this.idioma});
}

class OnChageTheme extends ShaderpreferencesEvent {
  final bool isDarkTheme;
  OnChageTheme({required this.isDarkTheme});
}
