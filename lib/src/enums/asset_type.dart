// ignore_for_file: constant_identifier_names
import 'package:hive/hive.dart';

part 'asset_type.g.dart';

@HiveType(typeId: 8)
enum AssetType {
  @HiveField(1)
  Stock,

  @HiveField(2)
  Index,

  @HiveField(3)
  Future,

  @HiveField(4)
  Currency,

  @HiveField(5)
  Cryptocurrency,

  // When adding to data storage, the type is unknown by default.
  @HiveField(6)
  Unknown,
}
