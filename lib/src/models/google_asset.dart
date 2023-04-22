import 'package:hive/hive.dart';
import 'asset.dart';
import 'market_summary.dart';
import 'google_news_article.dart';
import '../enums/market.dart';
import '../enums/currency.dart';
import '../enums/asset_type.dart';

part 'google_asset.g.dart';

@HiveType(typeId: 1)
class GoogleAsset extends Asset {
  @HiveField(7)
  final Market? market;

  @HiveField(8)
  final Currency? marketCurrency;

  @HiveField(9)
  final String? label;

  @HiveField(10)
  final num? currentPrice;

  @HiveField(11)
  final num? dailyPriceDelta;

  @HiveField(12)
  final num? preMarketPrice;

  @HiveField(13)
  final MarketSummary? marketSummary;

  @HiveField(14)
  final String? description;

  final List<GoogleNewsArticle>? news;

  GoogleAsset({
    required super.type,
    required super.ticker,
    this.market,
    this.marketCurrency,
    this.label,
    this.currentPrice,
    this.dailyPriceDelta,
    this.preMarketPrice,
    this.marketSummary,
    this.description,
    this.news,
  });
}
