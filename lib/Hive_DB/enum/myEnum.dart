import 'package:hive/hive.dart';

part 'myEnum.g.dart';

@HiveType(typeId: 1)
enum StatType {
  @HiveField(0)
  BAT_AVG,

  @HiveField(1)
  BAT_SR,

  @HiveField(2)
  BOWL_AVG,

  @HiveField(3)
  BOWL_SR,

  @HiveField(4)
  BOWL_ECONOMY,
}
