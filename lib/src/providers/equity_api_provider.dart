import 'package:flutter/foundation.dart';
import '../models/google_asset.dart';
import '../models/search_result.dart';
import '../models/market_stories.dart';
import '../services/equity_api_service.dart';

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
  List<SearchResult> _results = [];
  List<SearchResult> get results => _results;

  /* Asset Page */
  String? _selectedAssetTicker;
  String? get selectedAssetTicker => _selectedAssetTicker;
  GoogleAsset? _selectedAssetData;
  GoogleAsset? get selectedAssetData => _selectedAssetData;

  /* Available Assets */
  List<Map<String, dynamic>>? _availableGoogleAssets;
  List<Map<String, dynamic>>? get availableGoogleAssets =>
      _availableGoogleAssets;

  Future<void> searchAssets(String query) async {
    _setLoading(true);

    // Perform search, save results & update latest query.
    final List<SearchResult> googleResults =
        await _service.searchGoogleAssets(query);
    final List<SearchResult> binanceResults =
        await _service.searchBinanceAssets(query);
    _results = [...googleResults, ...binanceResults];
    _latestQuery = query;

    _setLoading(false);
  }

  Future<void> getGoogleFinanceMarketNews() async {
    _setLoading(true);
    _marketStories = await _service.getGoogleMarketFinanceNews();
    _setLoading(false);
  }

  Future<void> updateSelectedAssetTicker(String ticker) async {
    _setLoading(true);
    _selectedAssetTicker = ticker;
    _setLoading(false);
  }

  Future<void> getGoogleAssetData() async {
    _setLoading(true);
    _selectedAssetData =
        await _service.getGoogleAssetData(_selectedAssetTicker!);
    _setLoading(false);
  }

  Future<void> getAvailableGoogleAssets() async {
    _setLoading(true);
    _availableGoogleAssets = await _service.getAvailableGoogleAssets();
    _setLoading(false);
  }

  void _setLoading(bool value) {
    isLoading = value;
    value == true && isInitialized == false ? isInitialized = true : null;
    notifyListeners();
  }
}
