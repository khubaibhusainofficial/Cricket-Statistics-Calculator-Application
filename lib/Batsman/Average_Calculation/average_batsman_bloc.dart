import 'package:cricket_stats/Batsman/Average_Calculation/average_batsman_event.dart';
import 'package:cricket_stats/Batsman/Average_Calculation/average_batsman_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AverageBatsmanBloc
    extends Bloc<AverageBatsmanEvent, AverageBatsmanState> {
  AverageBatsmanBloc() : super(AverageBatsmanState()) {
    on<CalculateButton>(calc);
    on<ResetAllValues>(resetAllValues);
  }

  void calc(CalculateButton event, Emitter<AverageBatsmanState> emit) {
    int runsScored = event.runs;
    int timesOut = event.dismissals;
    final double avg = runsScored / timesOut;
    emit(
      state.copyWith(runs: runsScored, dismissals: timesOut, averageBat: avg),
    );
  }

  void resetAllValues(ResetAllValues event, Emitter<AverageBatsmanState> emit) {
    emit(AverageBatsmanState.setZero);
  }
}
