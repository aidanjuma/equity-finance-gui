import 'package:hive/hive.dart';
import '../enums/asset_type.dart';

part 'asset.g.dart';

/* Base Class: Asset */
@HiveType(typeId: 4)
class Asset {
  // Type of the asset, i.e. Stock, Future, etc.
  @HiveField(0)
  final AssetType type;
  // Asset ticker, i.e. 'BTC-USD'.
  @HiveField(1)
  final String ticker;

  /* The following fields are for use with data
     being stored on the device (exclusively). */

  // The price each unit was purchased at; uses currency set in settings.
  @HiveField(2)
  double? purchasePricePerUnit;

  // The amount of the asset purchased at that price.
  @HiveField(3)
  int? quantity;

  // Total value at time of purchase; i.e. quantity * purchasePricePerUnit.
  @HiveField(4)
  double? valueAtPurchaseTime;

  // Last known total value - data fetched and saved for use offline.
  @HiveField(5)
  double? lastKnownTotalValue;

  // Describes which provider the data was obtained from, i.e. Google Finance.
  @HiveField(6)
  String? providerName;

  Asset({
    required this.type,
    required this.ticker,
    this.quantity,
    this.purchasePricePerUnit,
    this.valueAtPurchaseTime,
    this.lastKnownTotalValue,
    this.providerName,
  });
}
