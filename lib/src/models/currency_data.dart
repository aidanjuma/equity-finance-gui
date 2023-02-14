import 'google_news_article.dart';
import 'package:equity/src/enums/currency.dart';

/* Class: CurrencyData from Google */
class CurrencyData {
  // Base currency ISO4217 code, i.e. Currency.GBP.
  final Currency baseCurrency;

  // Quote currency ISO4217 code, i.e. Currency.USD.
  final Currency quoteCurrency;

  // 1:X as a double; i.e. 1.08 (1GBP=1.08USD).
  final double price;

  // List of related news articles.
  final List<GoogleNewsArticle> news;

  CurrencyData({
    required this.baseCurrency,
    required this.quoteCurrency,
    required this.price,
    required this.news,
  });
}
