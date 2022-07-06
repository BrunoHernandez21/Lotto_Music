import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'historial_eventos_event.dart';
part 'historial_eventos_state.dart';

class HistorialEventosBloc extends Bloc<HistorialEventosEvent, HistorialEventosState> {
  HistorialEventosBloc() : super(HistorialEventosInitial()) {
    on<HistorialEventosEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
