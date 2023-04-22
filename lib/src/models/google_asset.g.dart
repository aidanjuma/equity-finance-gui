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
      market: fields[7] as Market?,
      marketCurrency: fields[8] as Currency?,
      label: fields[9] as String?,
      currentPrice: fields[10] as num?,
      dailyPriceDelta: fields[11] as num?,
      preMarketPrice: fields[12] as num?,
      marketSummary: fields[13] as MarketSummary?,
      description: fields[14] as String?,
    )
      ..purchasePricePerUnit = fields[2] as double?
      ..quantity = fields[3] as int?
      ..valueAtPurchaseTime = fields[4] as double?
      ..lastKnownTotalValue = fields[5] as double?
      ..providerName = fields[6] as String?;
  }

  @override
  void write(BinaryWriter writer, GoogleAsset obj) {
    writer
      ..writeByte(15)
      ..writeByte(7)
      ..write(obj.market)
      ..writeByte(8)
      ..write(obj.marketCurrency)
      ..writeByte(9)
      ..write(obj.label)
      ..writeByte(10)
      ..write(obj.currentPrice)
      ..writeByte(11)
      ..write(obj.dailyPriceDelta)
      ..writeByte(12)
      ..write(obj.preMarketPrice)
      ..writeByte(13)
      ..write(obj.marketSummary)
      ..writeByte(14)
      ..write(obj.description)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.ticker)
      ..writeByte(2)
      ..write(obj.purchasePricePerUnit)
      ..writeByte(3)
      ..write(obj.quantity)
      ..writeByte(4)
      ..write(obj.valueAtPurchaseTime)
      ..writeByte(5)
      ..write(obj.lastKnownTotalValue)
      ..writeByte(6)
      ..write(obj.providerName);
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
