import 'package:bloc/bloc.dart';
import 'package:cricket_stats/Average/avg_event.dart';
import 'package:cricket_stats/Average/avg_state.dart';

class AvgBloc extends Bloc<AvgEvent, AvgState> {
  AvgBloc() : super(AvgState()) {
    on<ButtonHit>(pressButton);
    on<ResetAll>(resetAll);
  }

  void pressButton(ButtonHit event, Emitter<AvgState> emit) {
    int runsConceded = event.runs;
    int wicket = event.wkts;
    double average = wicket == 0 ? 0 : (runsConceded / wicket);
    emit(state.copyWith(runsConceded, wicket, average));
  }

  void resetAll(ResetAll event, Emitter<AvgState> emit) {
    emit(AvgState.resetZero);
  }
}
