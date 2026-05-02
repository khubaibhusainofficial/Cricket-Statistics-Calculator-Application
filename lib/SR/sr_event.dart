import 'package:equatable/equatable.dart';

abstract class SrEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];

  const SrEvent();
}

class PressButton extends SrEvent {
  final int wkts, overs;

  const PressButton({
    required this.wkts,
    required this.overs,
  });

  @override
  // TODO: implement props
  List<Object> get props => [wkts, overs];
}
class ResetSrEvent extends SrEvent {
  const ResetSrEvent();
}
