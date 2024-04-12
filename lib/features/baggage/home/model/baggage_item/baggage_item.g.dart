// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'baggage_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BaggageItemAdapter extends TypeAdapter<BaggageItem> {
  @override
  final int typeId = 2;

  @override
  BaggageItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BaggageItem(
      description: fields[0] as String,
      category: fields[1] as BaggageItemCategory,
      quantity: fields[2] as int,
      weight: fields[3] as int,
      measure: fields[4] as Measure,
    );
  }

  @override
  void write(BinaryWriter writer, BaggageItem obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.description)
      ..writeByte(1)
      ..write(obj.category)
      ..writeByte(2)
      ..write(obj.quantity)
      ..writeByte(3)
      ..write(obj.weight)
      ..writeByte(4)
      ..write(obj.measure);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BaggageItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
