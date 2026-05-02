import 'package:bloc/bloc.dart';
import 'package:cricket_stats/Economy/economy_event.dart';
import 'package:cricket_stats/Economy/economy_state.dart';
import 'package:cricket_stats/Hive_DB/enum/myEnum.dart';
import 'package:hive/hive.dart';

import '../Hive_DB/Models/getData.dart';
import '../Hive_DB/Models/model_stats.dart';

class EconomyBloc extends Bloc<EconomyEvent, EconomyState> {
  EconomyBloc() : super(EconomyState()) {
    on<ButtonPress>(_calculation);
    on<ResetResult>(zero);
  }

  void _calculation(ButtonPress event, Emitter<EconomyState> emit) {
    final formula = (event.runs / event.overs);
    emit(state.copyWith(event.runs, event.overs, formula));

    final myModel = ModelStats(
      type: StatType.BOWL_ECONOMY,
      result: formula,
      input: {"Runs Conceded": event.runs, "Overs Bowled": event.overs},
      createdAt: DateTime.now(),
    );
    final box = MyBoxes.getMyData();
    box.add(myModel);
    print(Hive.box<ModelStats>('statsBox').length);
  }

  void zero(ResetResult event, Emitter<EconomyState> emit) {
    emit(EconomyState.zero);
  }
}
