import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  TimerBloc() : super(TimerInitial()) {
    on<TimerStarted>(_onTimerStarted);
    on<_TimerTicked>(_onTimerTicked);
  }

  StreamSubscription<int>? _tickerSubscription;

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  void _onTimerStarted(TimerStarted event, Emitter<TimerState> emit) {
    final duration = event.duration.inSeconds;

    emit(TimerRunInProgress(duration: duration));
    _tickerSubscription?.cancel();

    _tickerSubscription =
        Stream.periodic(const Duration(seconds: 1), (x) => duration - x - 1)
            .take(duration)
            .listen((tick) => add(_TimerTicked(duration: tick)));
  }

  void _onTimerTicked(
    _TimerTicked event,
    Emitter<TimerState> emit,
  ) {
    emit(
      event.duration > 0
          ? TimerRunInProgress(duration: event.duration)
          : TimerRunComplete(),
    );
  }
}
