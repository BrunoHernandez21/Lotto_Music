part of 'carrito_bloc.dart';

@immutable
class CarritoState {
  final List<Ordenes>? ordenes;
  const CarritoState({
    this.ordenes,
  });
}
