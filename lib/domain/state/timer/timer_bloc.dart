import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends HydratedBloc<TimerEvent, TimerState> {
  TimerBloc() : super(TimerInitial()) {
    on<TimerStarted>(_onTimerStarted);
    on<TimerStop>(_onTimerStop);
    on<TimerResume>(_onTimerResume);
    on<_TimerTicked>(_onTimerTicked);
  }

  StreamSubscription<Duration>? _tickerSubscription;

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  void _onTimerStarted(TimerStarted event, Emitter<TimerState> emit) {
    final seconds = event.duration.inSeconds;
    final doneTime = DateTime.now().add(event.duration);

    emit(
      TimerRunInProgress(
        duration: event.duration,
        formattedDuration: _formatTime(event.duration),
        doneTime: doneTime,
      ),
    );
    _tickerSubscription?.cancel();

    _tickerSubscription = Stream<Duration>.periodic(
      const Duration(seconds: 1),
      (x) => doneTime.difference(DateTime.now()),
    )
        .take(
          seconds,
        )
        .listen(
          (tick) => add(
            _TimerTicked(currentDuration: tick, doneTime: doneTime),
          ),
        );
  }

  void _onTimerTicked(
    _TimerTicked event,
    Emitter<TimerState> emit,
  ) {
    final seconds = event.currentDuration.inSeconds;

    emit(
      seconds > 0
          ? TimerRunInProgress(
              duration: event.currentDuration,
              formattedDuration: _formatTime(event.currentDuration),
              doneTime: event.doneTime,
            )
          : TimerRunComplete(),
    );
  }

  void _onTimerStop(TimerStop event, Emitter<TimerState> emit) {
    _tickerSubscription?.cancel();

    emit(TimerRunComplete());
  }

  void _onTimerResume(
    TimerResume event,
    Emitter<TimerState> emit,
  ) {
    if (state is! TimerRunInProgress) {
      throw Exception('timer is not running before');
    }

    final trp = state as TimerRunInProgress;
    final seconds = trp.duration.inSeconds;
    final doneTime = DateTime.now().add(trp.duration);

    emit(
      TimerRunInProgress(
        duration: trp.duration,
        formattedDuration: _formatTime(trp.duration),
        doneTime: doneTime,
      ),
    );

    _tickerSubscription = Stream<Duration>.periodic(
      const Duration(seconds: 1),
      (x) => doneTime.difference(DateTime.now()),
    )
        .take(
          seconds,
        )
        .listen(
          (tick) => add(
            _TimerTicked(currentDuration: tick, doneTime: doneTime),
          ),
        );
  }

  String _formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  @override
  TimerState? fromJson(Map<String, dynamic> json) {
    if (json['doneTime'] != null) {
      final doneTime = DateTime.parse(json['doneTime'] as String);
      final duration = doneTime.difference(DateTime.now());
      return TimerRunInProgress(
        duration: duration,
        formattedDuration: _formatTime(duration),
        doneTime: doneTime,
      );
    }
    return null;
  }

  @override
  Map<String, dynamic>? toJson(TimerState state) {
    switch (state) {
      case TimerRunInProgress():
        return {'doneTime': state.doneTime.toIso8601String()};
      default:
        return null;
    }
  }
}
