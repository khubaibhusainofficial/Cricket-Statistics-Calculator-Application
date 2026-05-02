import 'package:equatable/equatable.dart';

abstract class AverageBatsmanEvent extends Equatable {
  const AverageBatsmanEvent();
}

class CalculateButton extends AverageBatsmanEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [runs, dismissals];

  final int runs, dismissals;

  const CalculateButton({required this.runs, required this.dismissals});
}
class ResetAllValues extends AverageBatsmanEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
