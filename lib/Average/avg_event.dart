import 'package:equatable/equatable.dart';

abstract class AvgEvent extends Equatable {
  const AvgEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ButtonHit extends AvgEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [runs, wkts];

  final int runs, wkts;

  const ButtonHit({required this.runs, required this.wkts});
}

class ResetAll extends AvgEvent {}
