import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'videos_event_controller_event.dart';
part 'videos_event_controller_state.dart';

class VEPageControllerBloc
    extends Bloc<VEPageControllerEvent, VEPageControllerState> {
  VEPageControllerBloc() : super(const VEPageControllerState(page: 1)) {
    on<OnSelectPapge>((event, emit) {
      emit(VEPageControllerState(page: event.page));
    });
  }
}
