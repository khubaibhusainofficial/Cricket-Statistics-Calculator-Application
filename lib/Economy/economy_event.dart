import 'package:equatable/equatable.dart';

abstract class EconomyEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];

  const EconomyEvent();
}

class ButtonPress extends EconomyEvent {
  final int runs;
  final double overs;

  const ButtonPress({required this.runs, required this.overs});

  @override
  // TODO: implement props
  List<Object> get props => [runs, overs];
}
class ResetResult extends EconomyEvent{}
