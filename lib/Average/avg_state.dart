import 'package:equatable/equatable.dart';

class AvgState extends Equatable {
  static AvgState resetZero = AvgState();

  @override
  // TODO: implement props
  List<Object?> get props => [runs,wkts,average];

  final int runs, wkts;
  final double average;

 const AvgState({this.runs = 0, this.wkts = 0, this.average = 0});

  AvgState copyWith(int? runs, int? wkts, double? average) {
    return AvgState(
      runs: runs ?? this.runs,
      wkts: wkts ?? this.wkts,
      average: average ?? this.average,
    );
  }
}
