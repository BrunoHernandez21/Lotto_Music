import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/user/cartera.dart';

part 'cartera_event.dart';
part 'cartera_state.dart';

class CarteraBloc extends Bloc<CarteraEvent, CarteraState> {
  CarteraBloc() : super(CarteraState(cartera: CarteraModel())) {
    on<OnLoadCartera>((event, emit) {
      emit(CarteraState(cartera: event.cartera));
    });
  }
}
