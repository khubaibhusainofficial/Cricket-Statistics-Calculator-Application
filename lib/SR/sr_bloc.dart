import 'package:cricket_stats/Hive_DB/Models/getData.dart';
import 'package:cricket_stats/Hive_DB/Models/model_stats.dart';
import 'package:cricket_stats/Hive_DB/enum/myEnum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'sr_event.dart';
import 'sr_state.dart';

class SrBloc extends Bloc<SrEvent, SrState> {
  SrBloc() : super(const SrState()) {
    on<PressButton>(_calculateSR);
    on<ResetSrEvent>(_reset);
  }

  void _calculateSR(PressButton event, Emitter<SrState> emit) {
    final int overs = event.overs;
    final int balls = overs * 6;
    final int wkts = event.wkts;

    final double strikeRate = wkts == 0 ? 0 : (balls / wkts);

    emit(state.copyWith(wkts: wkts, overs: overs, SR: strikeRate));

    // Save to Hive
    final myModel = ModelStats(
      type: StatType.BOWL_SR,
      result: strikeRate,
      input: {
        "Overs Bowled": overs,
        "Deliveries Bowled": balls,
        "Wickets Taken": wkts,
      },
      createdAt: DateTime.now(),
    );
    Hive.box<ModelStats>("Save Results").add(myModel);
  }

  void _reset(ResetSrEvent event, Emitter<SrState> emit) {
    emit(SrState.initial);
  }
}
