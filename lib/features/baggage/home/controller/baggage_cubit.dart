import 'package:baggage/app/main.dart';
import 'package:baggage/features/baggage/home/model/baggage/baggage.dart';
import 'package:baggage/features/baggage/home/model/baggage_item/baggage_item.dart';
import 'package:bloc/bloc.dart';

class BaggageCubit extends Cubit<List<Baggage>> {
  BaggageCubit() : super([]) {
    read();
  }

  create(Baggage baggage) {
    baggageBox.add(baggage).whenComplete(() => read());
  }

  addItem(int index, BaggageItem baggageItem) {
    final baggage = state[index];
    baggageBox
        .putAt(
          index,
          baggage.copyWith(
            content: [...baggage.content, baggageItem],
          ),
        )
        .whenComplete(() => read());
  }

  read() {
    List<Baggage> baggageList = [];
    if (baggageBox.isNotEmpty) {
      for (var i = 0; i < baggageBox.length; i++) {
        final baggage = baggageBox.getAt(i);
        baggageList.add(baggage!);
      }
      emit(baggageList);
    } else {
      emit([]);
    }
  }

  updateItem(
      {required int baggageIndex,
      required int baggageItemIndex,
      required BaggageItem baggageItem}) {
    final baggage = state[baggageIndex];
    baggage.content[baggageItemIndex] = baggageItem;
    baggageBox.putAt(baggageIndex, baggage).whenComplete(() => read());
  }

  delete(int index) => baggageBox.deleteAt(index).whenComplete(() => read());

  deleteItem({
    required int baggageIndex,
    required int baggageItemIndex,
  }) {
    final baggage = state[baggageIndex];
    baggage.content.removeAt(baggageItemIndex);
    baggageBox.putAt(baggageIndex, baggage).whenComplete(() => read());
  }
}
