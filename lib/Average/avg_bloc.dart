import 'package:bloc/bloc.dart';
import 'package:cricket_stats/Average/avg_event.dart';
import 'package:cricket_stats/Average/avg_state.dart';
import 'package:cricket_stats/Hive_DB/enum/myEnum.dart';

import '../Hive_DB/Models/getData.dart';
import '../Hive_DB/Models/model_stats.dart';

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

    final myModel = ModelStats(
      type: StatType.BOWL_AVG,
      result: average,
      input: {"Runs Conceded": runsConceded, "Wickets Taken": wicket},
      createdAt: DateTime.now(),
    );
    final box = MyBoxes.getMyData();
    box.add(myModel);
  }
}

void resetAll(ResetAll event, Emitter<AvgState> emit) {
  emit(AvgState.resetZero);
}
