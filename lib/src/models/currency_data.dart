import 'package:equity/src/types/currency.dart';
import 'package:equity/src/models/google_news.dart';

class CurrencyData {
  final String type;
  final Currency baseCurrency;
  final Currency quoteCurrency;
  final double price;
  final List<GoogleNews> news;

  CurrencyData({
    required this.type,
    required this.baseCurrency,
    required this.quoteCurrency,
    required this.price,
    required this.news,
  });
}
