import 'package:equity/src/types/asset_type.dart';

class Asset {
  final AssetType type;
  final String ticker;

  Asset({required this.type, required this.ticker});
}
