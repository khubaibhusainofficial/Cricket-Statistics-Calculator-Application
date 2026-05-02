import 'package:equatable/equatable.dart';

class SrState extends Equatable {
  static const SrState initial = SrState();

  @override
  // TODO: implement props
  List<Object?> get props => [overs, wkts, SR];
  final int wkts, overs;
  final double SR;

  const SrState({this.overs = 0, this.wkts = 0, this.SR = 0});

  SrState copyWith({int? wkts, int? overs, double? SR}) {
    return SrState(
      wkts: wkts ?? this.wkts,
      overs: overs ?? this.overs,
      SR: SR ?? this.SR,
    );
  }
}
