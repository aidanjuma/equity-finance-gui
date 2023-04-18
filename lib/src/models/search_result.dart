class SearchResult {
  // Denotes where search result is from, i.e. 'Google Finance'.
  final String provider;

  // Asset ticker, i.e. 'BTC-USD'.
  final String ticker;

  // Market that asset originates from.
  final String? market;

  SearchResult({
    required this.provider,
    required this.ticker,
    this.market,
  });
}
