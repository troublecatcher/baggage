import 'package:baggage/features/baggage/home/model/baggage_item/baggage_item.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'baggage.g.dart';

@HiveType(typeId: 3)
class Baggage {
  @HiveField(0)
  final int capacity;
  @HiveField(1)
  final String colorHex;
  @HiveField(2)
  final List<BaggageItem> content;

  Baggage({
    required this.capacity,
    required this.colorHex,
    required this.content,
  });

  Baggage copyWith({
    int? capacity,
    String? colorHex,
    List<BaggageItem>? content,
  }) {
    return Baggage(
      capacity: capacity ?? this.capacity,
      colorHex: colorHex ?? this.colorHex,
      content: content ?? this.content,
    );
  }
}
