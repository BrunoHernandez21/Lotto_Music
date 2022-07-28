import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/plan.dart';

part 'suscripciones_event.dart';
part 'suscripciones_state.dart';

class SuscripcionesBloc extends Bloc<PlanesEvent, SuscripcionesState> {
  SuscripcionesBloc() : super(const SuscripcionesState()) {
    on<OnLoadSuscripciones>((event, emit) {
      emit(SuscripcionesState(planes: event.planes));
    });
  }
}
