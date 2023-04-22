// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_summary.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MarketSummaryAdapter extends TypeAdapter<MarketSummary> {
  @override
  final int typeId = 2;

  @override
  MarketSummary read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MarketSummary(
      primaryExchange: fields[0] as Market?,
      previousClosePrice: fields[1] as double?,
      marketCap: fields[2] as int?,
      dayRange: fields[3] as PriceRange?,
      yearRange: fields[4] as PriceRange?,
      volume: fields[5] as int?,
      avgVolume: fields[6] as int?,
      pteRatio: fields[7] as double?,
      settlementPrice: fields[8] as double?,
      marketSegment: fields[9] as String?,
      dividendYield: fields[10] as double?,
      openInterest: fields[11] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, MarketSummary obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.primaryExchange)
      ..writeByte(1)
      ..write(obj.previousClosePrice)
      ..writeByte(2)
      ..write(obj.marketCap)
      ..writeByte(3)
      ..write(obj.dayRange)
      ..writeByte(4)
      ..write(obj.yearRange)
      ..writeByte(5)
      ..write(obj.volume)
      ..writeByte(6)
      ..write(obj.avgVolume)
      ..writeByte(7)
      ..write(obj.pteRatio)
      ..writeByte(8)
      ..write(obj.settlementPrice)
      ..writeByte(9)
      ..write(obj.marketSegment)
      ..writeByte(10)
      ..write(obj.dividendYield)
      ..writeByte(11)
      ..write(obj.openInterest);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MarketSummaryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
