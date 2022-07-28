part of 'carrito_bloc.dart';

@immutable
abstract class CarritoEvent {}

class OnLoadCarrito extends CarritoEvent {
  final List<ItemsCarrito>? itemsCarrito;
  OnLoadCarrito({required this.itemsCarrito});
}
