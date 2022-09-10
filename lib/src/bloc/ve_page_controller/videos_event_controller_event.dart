part of 'videos_event_controller_bloc.dart';

@immutable
abstract class VEPageControllerEvent {}

class OnSelectPapge extends VEPageControllerEvent{
  final int page;

  OnSelectPapge({required this.page});
}
