part of 'timer_bloc.dart';

sealed class TimerState extends Equatable {
  const TimerState();

  @override
  List<Object> get props => [];
}

final class TimerInitial extends TimerState {}

final class TimerRunInProgress extends TimerState {
  const TimerRunInProgress({
    required this.duration,
    required this.formattedDuration,
    required this.doneTime,
  });

  final Duration duration;
  final DateTime doneTime;
  final String formattedDuration;

  @override
  List<Object> get props => [duration, formattedDuration, doneTime];
}

final class TimerRunComplete extends TimerState {}
