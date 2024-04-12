import 'package:baggage/features/baggage/home/model/baggage/baggage.dart';
import 'package:baggage/features/baggage/home/model/measure/measure.dart';

int totalWeight(Baggage baggage) {
  int weight = 0;
  for (final element in baggage.content) {
    switch (element.measure) {
      case Measure.kg:
        weight += element.weight * 1000;
        break;
      case Measure.gram:
        weight += element.weight;
        break;
    }
  }
  return weight;
}
