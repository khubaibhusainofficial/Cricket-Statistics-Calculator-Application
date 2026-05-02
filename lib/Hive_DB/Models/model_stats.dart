import 'package:cricket_stats/Hive_DB/enum/myEnum.dart';
import 'package:hive/hive.dart';

part 'model_stats.g.dart';

@HiveType(typeId: 0)
class ModelStats extends HiveObject {

  @HiveField(0)
  final StatType type;

  @HiveField(1)
  final double result;

  @HiveField(2)
  final Map<String, dynamic> input;

  @HiveField(3)
  final DateTime createdAt;

  ModelStats({
    required this.type,
    required this.result,
    required this.input,
    required this.createdAt,
  });
}