import 'asset.dart';
import 'market_summary.dart';
import 'google_news_article.dart';
import 'package:equity/src/enums/market.dart';
import 'package:equity/src/enums/currency.dart';

class GoogleAsset extends Asset {
  final Market? market;
  final Currency? marketCurrency;
  final String? label;
  final num? currentPrice;
  final num? dailyPriceDelta;
  final num? preMarketPrice;
  final MarketSummary? marketSummary;
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
