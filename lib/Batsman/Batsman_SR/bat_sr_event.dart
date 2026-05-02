import 'package:equatable/equatable.dart';

abstract class BatSrEvent extends Equatable{
const  BatSrEvent();
}

class ClickHere extends BatSrEvent
{
  @override
  // TODO: implement props
  List<Object?> get props => [run,ball];

  final int run,ball;
  const ClickHere({required this.run,required this.ball});
}
class ResetBatSR extends BatSrEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
