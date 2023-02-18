import 'package:flutter/foundation.dart';
import 'package:equity/src/models/search_result.dart';
import 'package:equity/src/models/market_stories.dart';
import 'package:equity/src/services/equity_api_service.dart';

class EquityApiProvider extends ChangeNotifier {
  final EquityApiService _service = EquityApiService();

  bool isInitialized = false;
  bool isLoading = false;

  /* Google Finance: News */
  MarketStories? _marketStories;
  MarketStories? get marketStories => _marketStories;

  /* Search */
  String _latestQuery = '';
  String get latestQuery => _latestQuery;
  List<SearchResult>? _results;
  List<SearchResult>? get results => _results;

  Future<void> searchGoogleAssets(String query) async {
    _setLoading(true);

    // Perform search, save results & update latest query.
    final List<SearchResult>? results =
        await _service.searchGoogleAssets(query);
    _results = results;
    _latestQuery = query;

    _setLoading(false);
  }

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
