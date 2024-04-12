import 'package:baggage/features/baggage/home/model/baggage_item_category/baggage_item_category.dart';
import 'package:baggage/features/baggage/home/model/measure/measure.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'baggage_item.g.dart';

@HiveType(typeId: 2)
class BaggageItem {
  @HiveField(0)
  final String description;

  @HiveField(1)
  final BaggageItemCategory category;

  @HiveField(2)
  final int quantity;

  @HiveField(3)
  final int weight;

  @HiveField(4)
  final Measure measure;

  BaggageItem({
    required this.description,
    required this.category,
    required this.quantity,
    required this.weight,
    required this.measure,
  });
}
