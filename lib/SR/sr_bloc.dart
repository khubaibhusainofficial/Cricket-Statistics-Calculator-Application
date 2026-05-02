import 'package:flutter_bloc/flutter_bloc.dart';
import 'sr_event.dart';
import 'sr_state.dart';

class SrBloc extends Bloc<SrEvent, SrState> {
  SrBloc() : super(const SrState()) {
    on<PressButton>(_calculateSR);
    on<ResetSrEvent>(_reset);
  }

  void _calculateSR(PressButton event, Emitter<SrState> emit) {
    final int balls = ((event.overs) * 6);
    final double strikeRate = event.overs == 0 ? 0 : (balls / event.wkts);

    emit(state.copyWith(wkts: event.wkts, overs: balls, SR: strikeRate));
  }

  void _reset(ResetSrEvent event, Emitter<SrState> emit) {
    emit(SrState.initial);
  }
}
