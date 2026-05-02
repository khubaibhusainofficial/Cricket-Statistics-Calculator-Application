import 'package:bloc/bloc.dart';
import 'package:cricket_stats/Economy/economy_event.dart';
import 'package:cricket_stats/Economy/economy_state.dart';

class EconomyBloc extends Bloc<EconomyEvent, EconomyState> {
  EconomyBloc() : super(EconomyState()) {
    on<ButtonPress>(_calculation);
    on<ResetResult>(zero);
  }

  void _calculation(ButtonPress event, Emitter<EconomyState> emit) {
    final formula = (event.runs / event.overs);
    emit(state.copyWith(event.runs, event.overs, formula));
  }
  void zero(ResetResult event,Emitter<EconomyState>emit)
  {
    emit(EconomyState.zero);
  }
}
