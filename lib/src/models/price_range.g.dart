// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_range.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PriceRangeAdapter extends TypeAdapter<PriceRange> {
  @override
  final int typeId = 3;

  @override
  PriceRange read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PriceRange(
      low: fields[0] as num,
      high: fields[1] as num,
    );
  }

  @override
  void write(BinaryWriter writer, PriceRange obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.low)
      ..writeByte(1)
      ..write(obj.high);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PriceRangeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
