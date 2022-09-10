import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dialogs_on_display_event.dart';
part 'dialogs_on_display_state.dart';

class DialogsOnDisplayBloc
    extends Bloc<DialogsOnDisplayEvent, DialogsOnDisplayState> {
  DialogsOnDisplayBloc()
      : super(const DialogsOnDisplayState(isLoading: false)) {
    on<OnIsLoading>((event, emit) {
      emit(DialogsOnDisplayState(isLoading: event.isLoading));
    });
  }
}
