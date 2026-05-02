import 'package:equatable/equatable.dart';

class BatSrState extends Equatable {

  static BatSrState setToZeroAll=BatSrState();

  @override
  // TODO: implement props
  List<Object?> get props => [run, ball, srBat,setToZeroAll];

  final int run, ball;
  final double srBat;

  const BatSrState({this.run = 0, this.ball = 0, this.srBat = 0});

  BatSrState copyWith({int? run, int? ball, double? srBat}) {
    return BatSrState(
      run: run ?? this.run,
      ball: ball ?? this.ball,
      srBat: srBat ?? this.srBat,
    );
  }
}
