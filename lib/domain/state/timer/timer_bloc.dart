import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  TimerBloc() : super(TimerInitial()) {
    on<TimerStarted>(_onTimerStarted);
  }

  Future<void> _onTimerStarted(TimerStarted event, Emitter<TimerState> emit) {
    final duration = event.duration.inSeconds;

    emit(TimerRunInProgress(duration: duration));
    return emit.forEach(
      Stream.periodic(const Duration(seconds: 1), (x) => duration - x - 1)
          .take(duration),
      onData: (ticker) {
        if (ticker == 0) {
          return TimerRunComplete();
        }

        return TimerRunInProgress(duration: ticker);
      },
    );
  }
}
