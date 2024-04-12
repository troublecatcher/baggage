// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'baggage.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BaggageAdapter extends TypeAdapter<Baggage> {
  @override
  final int typeId = 3;

  @override
  Baggage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Baggage(
      capacity: fields[0] as int,
      colorHex: fields[1] as String,
      content: (fields[2] as List).cast<BaggageItem>(),
    );
  }

  @override
  void write(BinaryWriter writer, Baggage obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.capacity)
      ..writeByte(1)
      ..write(obj.colorHex)
      ..writeByte(2)
      ..write(obj.content);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BaggageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
