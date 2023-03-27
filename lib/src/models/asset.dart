import 'package:hive/hive.dart';
import '../enums/asset_type.dart';

/* Base Class: Asset */
@HiveType(typeId: 4)
class Asset {
  // Type of the asset, i.e. Stock, Future, etc.
  @HiveField(0)
  final AssetType type;
  // Asset ticker, i.e. 'BTC-USD'.
  @HiveField(1)
  final String ticker;

  Asset({required this.type, required this.ticker});
}
