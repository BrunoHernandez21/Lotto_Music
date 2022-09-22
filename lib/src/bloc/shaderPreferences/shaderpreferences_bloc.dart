import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../cores/orquestador/orquestador.dart';

part 'shaderpreferences_event.dart';
part 'shaderpreferences_state.dart';

class ShaderpreferencesBloc
    extends Bloc<ShaderpreferencesEvent, ShaderpreferencesState> {
  ShaderpreferencesBloc({
    required ShaderpreferencesState shaderState,
  }) : super(shaderState) {
    //cambios de idioma
    on<OnChageLocale>((event, emit) {
      final estado = state.copyWith(idioma: event.idioma);
      Orquestador.sistem.saveShaderLocale(estado);
      emit(estado);
    });
    //cambios de tema
    on<OnChageTheme>((event, emit) {
      final estado = state.copyWith(isDarkTheme: event.isDarkTheme);
      Orquestador.sistem.saveShaderLocale(estado);
      emit(estado);
    });
  }
}
