import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'carrito_event.dart';
part 'carrito_state.dart';

class CarritoBloc extends Bloc<CarritoEvent, CarritoState> {
  CarritoBloc() : super(CarritoInitial()) {
    on<CarritoEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
