import 'package:bloc/bloc.dart';
import 'package:cricket_stats/Batsman/Batsman_SR/bat_sr_event.dart';
import 'package:cricket_stats/Batsman/Batsman_SR/bat_sr_state.dart';
import 'package:cricket_stats/Hive_DB/enum/myEnum.dart';

import '../../Hive_DB/Models/getData.dart';
import '../../Hive_DB/Models/model_stats.dart';

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

    final myModel = ModelStats(
      type: StatType.BAT_SR,
      result: mySR,
      input: {"Runs Scored": runsPlayed, "Balls Played": ballsPlayed},
      createdAt: DateTime.now(),
    );
    final box = MyBoxes.getMyData();
    box.add(myModel);
  }

  void resetBatSR(ResetBatSR event, Emitter<BatSrState> emit) {
    emit(BatSrState.setToZeroAll);
  }
}
