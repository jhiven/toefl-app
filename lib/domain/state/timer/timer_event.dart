part of 'timer_bloc.dart';

sealed class TimerEvent extends Equatable {
  const TimerEvent();

  @override
  List<Object> get props => [];
}

final class TimerStarted extends TimerEvent {
  const TimerStarted({required this.duration});

  final Duration duration;

  @override
  List<Object> get props => [duration];
}

final class TimerStop extends TimerEvent {
  const TimerStop();
}

final class TimerResume extends TimerEvent {
  const TimerResume();
}

class _TimerTicked extends TimerEvent {
  const _TimerTicked({
    required this.currentDuration,
    required this.doneTime,
  });

  final Duration currentDuration;
  final DateTime doneTime;

  @override
  List<Object> get props => [currentDuration, doneTime];
}
