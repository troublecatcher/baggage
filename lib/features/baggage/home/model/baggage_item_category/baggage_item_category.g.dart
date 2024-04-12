// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'baggage_item_category.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BaggageItemCategoryAdapter extends TypeAdapter<BaggageItemCategory> {
  @override
  final int typeId = 1;

  @override
  BaggageItemCategory read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return BaggageItemCategory.clothes;
      case 1:
        return BaggageItemCategory.hygiene;
      case 2:
        return BaggageItemCategory.cosmetics;
      case 3:
        return BaggageItemCategory.electronics;
      case 4:
        return BaggageItemCategory.medication;
      case 5:
        return BaggageItemCategory.jewelry;
      case 6:
        return BaggageItemCategory.documents;
      default:
        return BaggageItemCategory.clothes;
    }
  }

  @override
  void write(BinaryWriter writer, BaggageItemCategory obj) {
    switch (obj) {
      case BaggageItemCategory.clothes:
        writer.writeByte(0);
        break;
      case BaggageItemCategory.hygiene:
        writer.writeByte(1);
        break;
      case BaggageItemCategory.cosmetics:
        writer.writeByte(2);
        break;
      case BaggageItemCategory.electronics:
        writer.writeByte(3);
        break;
      case BaggageItemCategory.medication:
        writer.writeByte(4);
        break;
      case BaggageItemCategory.jewelry:
        writer.writeByte(5);
        break;
      case BaggageItemCategory.documents:
        writer.writeByte(6);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BaggageItemCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
