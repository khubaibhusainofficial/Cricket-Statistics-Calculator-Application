import 'package:equatable/equatable.dart';

class AverageBatsmanState extends Equatable {
  static AverageBatsmanState setZero = AverageBatsmanState();

  @override
  // TODO: implement props
  List<Object?> get props => [setZero, runs, dismissals, averageBat];

  final int runs, dismissals;

  final double averageBat;

  const AverageBatsmanState(
      {this.runs = 0, this.dismissals = 0, this.averageBat = 0});

  AverageBatsmanState copyWith(
      {int? runs, int? dismissals, double?averageBat}) {
    return AverageBatsmanState(
        runs: runs ?? this.runs,
        dismissals: dismissals ?? this.dismissals,
        averageBat: averageBat ?? this.averageBat
    );
  }
}
