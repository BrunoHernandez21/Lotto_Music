import 'package:bloc/bloc.dart';
import 'package:lotto_music/src/models/tarjetas.dart';
import 'package:lotto_music/src/models/tarjetas_response.dart';
import 'package:meta/meta.dart';

part 'tarjetas_event.dart';
part 'tarjetas_state.dart';

class TarjetasBloc extends Bloc<TarjetasEvent, TarjetasState> {
  TarjetasBloc() : super(const TarjetasState()) {
    on<OnLoadTarjetas>((event, emit) {
      emit(TarjetasState(tarjetas: event.tarjetas));
    });
    on<OnSelectTarjetas>((event, emit) {
      emit(state.copyWhit(selected: event.selected));
    });
  }
}
