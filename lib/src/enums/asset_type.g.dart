// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AssetTypeAdapter extends TypeAdapter<AssetType> {
  @override
  final int typeId = 8;

  @override
  AssetType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 1:
        return AssetType.Stock;
      case 2:
        return AssetType.Index;
      case 3:
        return AssetType.Future;
      case 4:
        return AssetType.Currency;
      case 5:
        return AssetType.Cryptocurrency;
      default:
        return AssetType.Stock;
    }
  }

  @override
  void write(BinaryWriter writer, AssetType obj) {
    switch (obj) {
      case AssetType.Stock:
        writer.writeByte(1);
        break;
      case AssetType.Index:
        writer.writeByte(2);
        break;
      case AssetType.Future:
        writer.writeByte(3);
        break;
      case AssetType.Currency:
        writer.writeByte(4);
        break;
      case AssetType.Cryptocurrency:
        writer.writeByte(5);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AssetTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
