part of 'loading_bloc.dart';

@immutable
abstract class LoadingEvent {}

class OnLoading extends LoadingEvent {}

class OnNotLoading extends LoadingEvent {}
