import 'package:bloc/bloc.dart';
import 'package:lotto_music/src/models/user/direcciones.dart';
import 'package:lotto_music/src/models/user/direcciones_response.dart';
import 'package:meta/meta.dart';

part 'direcciones_event.dart';
part 'direcciones_state.dart';

class DireccionesBloc extends Bloc<DireccionesEvent, DireccionesState> {
  DireccionesBloc() : super(const DireccionesState()) {
    on<OnLoadDirecciones>((event, emit) {
      emit(DireccionesState(direcciones: event.direcciones));
    });
    on<OnSelectDireccion>((event, emit) {
      emit(state.copyWhit(selected: event.selected));
    });
  }
}
