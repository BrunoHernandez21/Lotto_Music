import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/plan.dart';

part 'planes_event.dart';
part 'planes_state.dart';

class PlanesBloc extends Bloc<PlanesEvent, PlanesState> {
  PlanesBloc() : super(const PlanesState()) {
    on<OnLoadPlanes>((event, emit) {
      emit(PlanesState(planes: event.planes));
    });
  }
}
