import 'package:hive/hive.dart';

import 'price_range.dart';
import '../enums/market.dart';

part 'market_summary.g.dart';

@HiveType(typeId: 2)
class MarketSummary {
  @HiveField(0)
  final Market? primaryExchange;

  @HiveField(1)
  final double? previousClosePrice;

  @HiveField(2)
  final int? marketCap;

  @HiveField(3)
  final PriceRange? dayRange;

  @HiveField(4)
  final PriceRange? yearRange;

  @HiveField(5)
  final int? volume;

  @HiveField(6)
  final int? avgVolume;

  @HiveField(7)
  final double? pteRatio;

  @HiveField(8)
  final double? settlementPrice;

  @HiveField(9)
  final String? marketSegment;

  @HiveField(10)
  final double? dividendYield;

  @HiveField(11)
  final double? openInterest;

  MarketSummary({
    this.primaryExchange,
    this.previousClosePrice,
    this.marketCap,
    this.dayRange,
    this.yearRange,
    this.volume,
    this.avgVolume,
    this.pteRatio,
    this.settlementPrice,
    this.marketSegment,
    this.dividendYield,
    this.openInterest,
  });
}
