import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/buy/order_response.dart';

part 'buy_event.dart';
part 'buy_state.dart';

class BuyBloc extends Bloc<BuyEvent, BuyState> {
  BuyBloc() : super(BuyState(orden: OrdenResponse(itemsOrden: []))) {
    on<OnClearBuyBloc>((event, emit) {
      emit(BuyState(orden: OrdenResponse(itemsOrden: [])));
    });
    on<OnloadOrden>((event, emit) {
      emit(BuyState(orden: event.orden));
    });
  }
}
