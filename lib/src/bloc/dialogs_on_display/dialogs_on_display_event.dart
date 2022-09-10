part of 'dialogs_on_display_bloc.dart';

@immutable
abstract class DialogsOnDisplayEvent {}

class OnIsLoading extends DialogsOnDisplayEvent {
  final bool isLoading;

  OnIsLoading({required this.isLoading});
}
