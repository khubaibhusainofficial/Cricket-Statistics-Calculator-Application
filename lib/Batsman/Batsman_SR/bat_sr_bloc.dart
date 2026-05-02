import 'package:bloc/bloc.dart';
import 'package:cricket_stats/Batsman/Batsman_SR/bat_sr_event.dart';
import 'package:cricket_stats/Batsman/Batsman_SR/bat_sr_state.dart';

class BatSrBloc extends Bloc<BatSrEvent, BatSrState> {
  BatSrBloc() : super(BatSrState()) {
    on<ClickHere>(clickHere);
    on<ResetBatSR>(resetBatSR);
  }

  void clickHere(ClickHere event, Emitter<BatSrState> emit) {
    final int ballsPlayed = event.ball;
    final int runsPlayed = event.run;
    double mySR = ((runsPlayed / ballsPlayed) * 100);
    emit(state.copyWith(run: runsPlayed, ball: ballsPlayed, srBat: mySR));
  }

  void resetBatSR(ResetBatSR event, Emitter<BatSrState> emit) {
    emit(BatSrState.setToZeroAll);
  }
}
