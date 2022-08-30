import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'loading_event.dart';
part 'loading_state.dart';

class LoadingBloc extends Bloc<LoadingEvent, LoadingState> {
  LoadingBloc()
      : super(const LoadingState(
          isLoading: false,
        )) {
    on<OnLoading>((event, emit) {
      emit(const LoadingState(
        isLoading: true,
      ));
    });
    on<OnNotLoading>((event, emit) {
      emit(const LoadingState(
        isLoading: true,
      ));
    });
  }
}
