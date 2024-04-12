import 'package:baggage/app/main.dart';
import 'package:baggage/features/baggage/home/model/baggage/baggage.dart';
import 'package:baggage/features/baggage/home/model/baggage_item/baggage_item.dart';
import 'package:baggage/features/baggage/home/model/baggage_item_category/baggage_item_category.dart';
import 'package:baggage/features/baggage/home/model/measure/measure.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(MeasureAdapter());
  Hive.registerAdapter(BaggageItemCategoryAdapter());
  Hive.registerAdapter(BaggageItemAdapter());
  Hive.registerAdapter(BaggageAdapter());
  baggageBox = await Hive.openBox('baggage');
}
