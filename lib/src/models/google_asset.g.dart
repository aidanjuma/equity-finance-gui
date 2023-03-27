// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_asset.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GoogleAssetAdapter extends TypeAdapter<GoogleAsset> {
  @override
  final int typeId = 1;

  @override
  GoogleAsset read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GoogleAsset(
      type: fields[0] as AssetType,
      ticker: fields[1] as String,
      market: fields[2] as Market?,
      marketCurrency: fields[3] as Currency?,
      label: fields[4] as String?,
      currentPrice: fields[5] as num?,
      dailyPriceDelta: fields[6] as num?,
      preMarketPrice: fields[7] as num?,
      marketSummary: fields[8] as MarketSummary?,
      description: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, GoogleAsset obj) {
    writer
      ..writeByte(10)
      ..writeByte(2)
      ..write(obj.market)
      ..writeByte(3)
      ..write(obj.marketCurrency)
      ..writeByte(4)
      ..write(obj.label)
      ..writeByte(5)
      ..write(obj.currentPrice)
      ..writeByte(6)
      ..write(obj.dailyPriceDelta)
      ..writeByte(7)
      ..write(obj.preMarketPrice)
      ..writeByte(8)
      ..write(obj.marketSummary)
      ..writeByte(9)
      ..write(obj.description)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.ticker);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GoogleAssetAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
