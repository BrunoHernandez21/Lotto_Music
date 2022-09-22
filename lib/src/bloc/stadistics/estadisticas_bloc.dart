import 'package:bloc/bloc.dart';
import 'package:lotto_music/src/models/video/stadistics_response.dart';
import 'package:meta/meta.dart';

part 'estadisticas_event.dart';
part 'estadisticas_state.dart';

class EstadisticasBloc extends Bloc<EstadisticasEvent, EstadisticasState> {
  EstadisticasBloc() : super(const EstadisticasState()) {
    on<OnUpdateStadistics>((event, emit) {
      emit(EstadisticasState(allStadistics: event.response));
    });
  }
}
