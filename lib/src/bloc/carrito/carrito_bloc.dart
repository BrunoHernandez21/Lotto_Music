import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
