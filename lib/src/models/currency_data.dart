import 'package:equity/src/types/currency.dart';
import 'package:equity/src/models/google_news.dart';

/* Class: CurrencyData from Google */
class CurrencyData {
  // Base currency ISO4217 code, i.e. Currency.GBP.
  final Currency baseCurrency;

  // Quote currency ISO4217 code, i.e. Currency.USD.
  final Currency quoteCurrency;

  // 1:X as a double; i.e. 1.08 (1GBP=1.08USD).
  final double price;

  // List of related news articles.
  final List<GoogleNews> news;

  CurrencyData({
    required this.baseCurrency,
    required this.quoteCurrency,
    required this.price,
    required this.news,
  });
}
