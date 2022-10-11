part of 'buy_bloc.dart';

@immutable
abstract class BuyEvent {}

class OnloadOrden extends BuyEvent {
  final OrdenResponse orden;
  OnloadOrden({required this.orden});
}

class OnClearBuyBloc extends BuyEvent {
  OnClearBuyBloc();
}
