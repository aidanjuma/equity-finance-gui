// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appearance.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppearanceAdapter extends TypeAdapter<Appearance> {
  @override
  final int typeId = 5;

  @override
  Appearance read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Appearance.light;
      case 1:
        return Appearance.dark;
      case 2:
        return Appearance.system;
      default:
        return Appearance.light;
    }
  }

  @override
  void write(BinaryWriter writer, Appearance obj) {
    switch (obj) {
      case Appearance.light:
        writer.writeByte(0);
        break;
      case Appearance.dark:
        writer.writeByte(1);
        break;
      case Appearance.system:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppearanceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
