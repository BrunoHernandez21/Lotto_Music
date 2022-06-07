part of 'curso_bloc.dart';

@immutable
class CursoState {
  final bool isBuy;
  CursoState({
    this.isBuy = false,
  });

  CursoState copyWhit({
    bool? isBuy,
  }) =>
      CursoState(
        isBuy: isBuy ?? this.isBuy,
      );
}
