import 'package:flutter/foundation.dart';
import 'package:equity/src/models/market_stories.dart';
import 'package:equity/src/services/equity_api_service.dart';

class EquityApiProvider extends ChangeNotifier {
  final EquityApiService _service = EquityApiService();

  bool isInitialized = false;
  bool isLoading = false;

  /* Google Finance: News */
  MarketStories? _marketStories;
  MarketStories? get marketStories => _marketStories;

  Future<void> getGoogleFinanceMarketNews() async {
    _setLoading(true);
    _marketStories = await _service.getGoogleMarketFinanceNews();
    _setLoading(false);
  }

  void _setLoading(bool value) {
    isLoading = value;
    value == true && isInitialized == false ? isInitialized = true : null;
    notifyListeners();
  }
}
