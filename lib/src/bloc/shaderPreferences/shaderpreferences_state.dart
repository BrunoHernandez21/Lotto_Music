part of 'shaderpreferences_bloc.dart';

class ShaderpreferencesState {
  ShaderpreferencesState({
    required this.isDarkTheme,
    required this.idioma,
    required this.recuerdame,
  });

  final bool isDarkTheme;
  final String idioma;
  final bool recuerdame;

  ShaderpreferencesState copyWith({
    bool? isDarkTheme,
    String? idioma,
    bool? recuerdame,
  }) =>
      ShaderpreferencesState(
        isDarkTheme: isDarkTheme ?? this.isDarkTheme,
        idioma: idioma ?? this.idioma,
        recuerdame: recuerdame ?? this.recuerdame,
      );

  factory ShaderpreferencesState.fromJson(String str) =>
      ShaderpreferencesState.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ShaderpreferencesState.fromMap(Map<String, dynamic> json) =>
      ShaderpreferencesState(
        isDarkTheme: json["isDarkTheme"],
        idioma: json["idioma"],
        recuerdame: json["recuerdame"],
      );

  Map<String, dynamic> toMap() => {
        "isDarkTheme": isDarkTheme,
        "idioma": idioma,
        "recuerdame": recuerdame,
      };
}
