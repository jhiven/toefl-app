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
  });

  final int duration;
  final String formattedDuration;

  @override
  List<Object> get props => [duration, formattedDuration];
}

final class TimerRunComplete extends TimerState {}
