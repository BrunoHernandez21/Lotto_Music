import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'pagados_event.dart';
part 'pagados_state.dart';

class PagadosBloc extends Bloc<PagadosEvent, PagadosState> {
  PagadosBloc() : super(PagadosInitial()) {
    on<PagadosEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
