import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../cores/orquestador/orquestador.dart';

part 'shaderpreferences_event.dart';
part 'shaderpreferences_state.dart';

class ShaderpreferencesBloc
    extends Bloc<ShaderpreferencesEvent, ShaderpreferencesState> {
  ShaderpreferencesBloc({
    required Locale locale,
    required ThemeData theme,
  }) : super(ShaderpreferencesState(
          idioma: locale,
          themeData: theme,
        )) {
    //cambios de idioma
    on<OnChageLocale>((event, emit) {
      Orquestador.sistem.saveLocale(event.idioma);
      emit(state.copyWhit(idioma: event.idioma));
    });
    //cambios de tema
    on<OnChageTheme>((event, emit) {
      Orquestador.sistem.saveTheme(event.themeData);
      return emit(state.copyWhit(themeData: event.themeData));
    });
    //cargar todas las preferencias
    on<OnLoadShaderPreferences>((event, emit) => emit(ShaderpreferencesState(
        idioma: event.idioma, themeData: event.themeData)));
  }
}
