part of 'carrito_bloc.dart';

@immutable
abstract class CarritoEvent {}

class OnLoadCarrito extends CarritoEvent {
  final List<Ordenes>? ordenes;
  OnLoadCarrito({required this.ordenes});
}
