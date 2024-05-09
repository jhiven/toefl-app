part of 'timer_bloc.dart';

sealed class TimerState extends Equatable {
  const TimerState();

  @override
  List<Object> get props => [];
}

final class TimerInitial extends TimerState {}

final class TimerRunInProgress extends TimerState {
  const TimerRunInProgress({required this.duration});

  final int duration;

  @override
  List<Object> get props => [duration];
}

final class TimerRunComplete extends TimerState {}
