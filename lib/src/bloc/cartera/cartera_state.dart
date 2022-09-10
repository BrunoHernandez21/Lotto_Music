part of 'cartera_bloc.dart';

@immutable
class CarteraState {
  final CarteraModel cartera;

  const CarteraState({required this.cartera});
  copyWhit(CarteraModel? cartera) => CarteraState(
        cartera: cartera ?? this.cartera,
      );
}
