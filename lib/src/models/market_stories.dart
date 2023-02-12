import 'google_news_article.dart';

class MarketStories {
  final List<GoogleNewsArticle> topStories;
  final List<GoogleNewsArticle> localMarket;
  final List<GoogleNewsArticle> worldMarkets;

  MarketStories({
    required this.topStories,
    required this.localMarket,
    required this.worldMarkets,
  });
}
