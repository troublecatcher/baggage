import 'package:hive_flutter/hive_flutter.dart';

part 'measure.g.dart';

@HiveType(typeId: 0)
enum Measure {
  @HiveField(0)
  gram,
  @HiveField(1)
  kg,
}
