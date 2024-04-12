// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'measure.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MeasureAdapter extends TypeAdapter<Measure> {
  @override
  final int typeId = 0;

  @override
  Measure read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Measure.gram;
      case 1:
        return Measure.kg;
      default:
        return Measure.gram;
    }
  }

  @override
  void write(BinaryWriter writer, Measure obj) {
    switch (obj) {
      case Measure.gram:
        writer.writeByte(0);
        break;
      case Measure.kg:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MeasureAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
