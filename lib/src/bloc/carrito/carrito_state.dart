part of 'carrito_bloc.dart';

@immutable
class CarritoState {
  final List<ItemsCarrito>? itemsCarrito;
  const CarritoState({
    this.itemsCarrito,
  });
}
