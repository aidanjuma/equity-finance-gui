import 'price_range.dart';
import 'package:equity/src/enums/market.dart';

class MarketSummary {
  final Market? primaryExchange;
  final double? previousClosePrice;
  final int? marketCap;
  final PriceRange? dayRange;
  final PriceRange? yearRange;
  final int? volume;
  final int? avgVolume;
  final double? pteRatio;
  final double? settlementPrice;
  final String? marketSegment;
  final double? dividendYield;
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
