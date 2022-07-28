import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/carrito_response.dart';

part 'carrito_event.dart';
part 'carrito_state.dart';

class CarritoBloc extends Bloc<CarritoEvent, CarritoState> {
  CarritoBloc() : super(const CarritoState()) {
    on<OnLoadCarrito>((event, emit) {
      emit(CarritoState(itemsCarrito: event.itemsCarrito));
    });
  }
}
