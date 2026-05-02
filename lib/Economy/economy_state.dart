import 'package:equatable/equatable.dart';

class EconomyState extends Equatable {

  static EconomyState zero = EconomyState();

  final int runs;
  final double overs;
  final double economy;

  const EconomyState({this.runs = 0, this.overs = 0, this.economy = 0});

  @override
  // TODO: implement props
  List<Object> get props => [runs, overs, economy];

  EconomyState copyWith(int? runs, double? overs, double? economy) {
    return EconomyState(
      runs: runs ?? this.runs,
      overs: overs ?? this.overs,
      economy: economy ?? this.economy,
    );
  }
}
