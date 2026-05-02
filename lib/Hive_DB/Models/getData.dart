import 'package:hive/hive.dart';
import 'model_stats.dart';

class MyBoxes
{
  static Box<ModelStats> getMyData()
  {
    return Hive.box<ModelStats>('Save Results');
  }
}
