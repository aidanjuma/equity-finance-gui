import 'package:equity/src/types/asset_type.dart';

/* Base Class: Asset */
class Asset {
  // Type of the asset, i.e. Stock, Future, etc.
  final AssetType type;
  // Asset ticker, i.e. 'BTC-USD'.
  final String ticker;

  Asset({required this.type, required this.ticker});
}
