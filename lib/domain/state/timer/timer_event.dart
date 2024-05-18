part of 'timer_bloc.dart';

sealed class TimerEvent extends Equatable {
  const TimerEvent();

  @override
  List<Object> get props => [];
}

final class TimerStarted extends TimerEvent {
  const TimerStarted({required this.duration});

  final Duration duration;
}

final class TimerStop extends TimerEvent {
  const TimerStop();
}

class _TimerTicked extends TimerEvent {
  const _TimerTicked({required this.duration});
  final int duration;
}
