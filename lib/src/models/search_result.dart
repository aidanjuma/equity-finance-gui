class SearchResult {
  // Asset ticker, i.e. 'BTC-USD'.
  final String ticker;

  // Market that asset originates from.
  final String? market;

  SearchResult({required this.ticker, required this.market});
}
