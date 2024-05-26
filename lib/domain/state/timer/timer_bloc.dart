import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  TimerBloc() : super(TimerInitial()) {
    on<TimerStarted>(_onTimerStarted);
    on<TimerStop>(_onTimerStop);
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

    emit(
      TimerRunInProgress(
        duration: duration,
        formattedDuration: _formatTime(event.duration),
      ),
    );
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
          ? TimerRunInProgress(
              duration: event.duration,
              formattedDuration: _formatTime(Duration(seconds: event.duration)),
            )
          : TimerRunComplete(),
    );
  }

  void _onTimerStop(TimerStop event, Emitter<TimerState> emit) {
    _tickerSubscription?.cancel();

    emit(TimerRunComplete());
  }

  String _formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return "$minutes:$seconds";
  }
}
