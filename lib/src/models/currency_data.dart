import 'package:equity/src/types/currency.dart';

class CurrencyData {
  final String type;
  final Currency baseCurrency;
  final Currency quoteCurrency;
  final double price;

  CurrencyData({
    required this.type,
    required this.baseCurrency,
    required this.quoteCurrency,
    required this.price,
  });
}
