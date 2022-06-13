import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'curso_event.dart';
part 'curso_state.dart';

class CursoBloc extends Bloc<CursoEvent, CursoState> {
  CursoBloc() : super(const CursoState()) {
    on<OnBuy>((event, emit) {
      emit(state.copyWhit(isBuy: event.isBuy));
    });
  }
}
