import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
// Local
import 'package:equity/src/enums/market.dart';
import 'package:equity/src/enums/currency.dart';
import 'package:equity/src/enums/asset_type.dart';
import 'package:equity/src/models/price_range.dart';
import 'package:equity/src/models/google_asset.dart';
import 'package:equity/src/models/search_result.dart';
import 'package:equity/src/models/market_stories.dart';
import 'package:equity/src/models/market_summary.dart';
import 'package:equity/src/models/google_news_article.dart';

class EquityApiService {
  final Client _client = Client();

  static const String _baseUrl = 'http://192.168.1.225:3000';
  static const String _binanceEndpoint = '$_baseUrl/fiat/binance';
  static const String _googleFinanceEndpoint = '$_baseUrl/fiat/google';

  /* Google Finance */
  Future<List<SearchResult>?> searchGoogleAssets(String query) async {
    final Uri url = Uri.parse('$_googleFinanceEndpoint/search/$query');

    final List<dynamic> results = await _makeGetRequest(() async {
      Response response = await _client.get(url);
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return data['results'];
    });

    if (results.isNotEmpty) {
      List<SearchResult> assets = [];

      for (int i = 0; i < results.length; i++) {
        final result = results[i];
        assets.add(
          SearchResult(
            ticker: result['ticker'],
            market: result['market'],
          ),
        );
      }

      return assets;
    }

    return null;
  }

  Future<MarketStories> getGoogleMarketFinanceNews() async {
    final Uri url = Uri.parse('$_googleFinanceEndpoint/news');

    final Map<String, dynamic> data = await _makeGetRequest(() async {
      Response response = await _client.get(url);
      return jsonDecode(response.body) as Map<String, dynamic>;
    });

    MarketStories stories = MarketStories(
      topStories: _parseNewsArticles(data["topStories"]),
      localMarket: _parseNewsArticles(data["localMarket"]),
      worldMarkets: _parseNewsArticles(data["worldMarkets"]),
    );

    return stories;
  }

  Future<GoogleAsset?> getGoogleAssetData(String ticker) async {
    final Uri url = Uri.parse('$_googleFinanceEndpoint/asset/$ticker');

    final Map<String, dynamic> data = await _makeGetRequest(() async {
      Response response = await _client.get(url);
      return jsonDecode(response.body) as Map<String, dynamic>;
    });

    final marketSummaryObj = data['marketSummary'];

    return GoogleAsset(
      ticker: ticker,
      label: data['label'],
      description: data['description'],
      type: AssetType.values.byName(data['assetType']),
      market: Market.values.byName(data['market']),
      marketCurrency: Currency.values.byName(data['marketCurrency']),
      currentPrice: data['currentPrice'],
      preMarketPrice: data['preMarketPrice'],
      marketSummary: marketSummaryObj != null
          ? _parseMarketSummary(marketSummaryObj)
          : null,
      news: _parseNewsArticles(data['news']),
    );
  }

  PriceRange _parsePriceRange(Map<String, dynamic> range) {
    return PriceRange(low: range['low'], high: range['high']);
  }

  // Parse news from GFI into GoogleNewsArticle objects.
  List<GoogleNewsArticle> _parseNewsArticles(List<dynamic> googleNews) {
    // Add each news article to a list.
    List<GoogleNewsArticle> news = [];
    for (int i = 0; i < googleNews.length; i++) {
      final item = googleNews[i];
      final GoogleNewsArticle article = GoogleNewsArticle(
        link: item['link'],
        publisher: item['publisher'],
        title: item['title'],
        thumbnailUrl: item['thumbnail'],
        whenPublished: item['whenPublished'],
      );

      news.add(article);
    }

    return news;
  }

  MarketSummary _parseMarketSummary(Map<String, dynamic> summary) {
    final primaryExchange = summary['primaryExchange'];

    return MarketSummary(
      primaryExchange: primaryExchange != null
          ? Market.values.byName(primaryExchange)
          : null,
      previousClosePrice: summary['previousClosePrice'],
      marketCap: summary['marketCap'],
      dayRange: _parsePriceRange(summary['dayRange']),
      yearRange: _parsePriceRange(summary['yearRange']),
      volume: summary['volume'],
      avgVolume: summary['avgVolume'],
      pteRatio: summary['pteRatio'],
      settlementPrice: summary['settlementPrice'],
      marketSegment: summary['marketSegment'],
      dividendYield: summary['dividendYield'],
      openInterest: summary['openInterest'],
    );
  }

  // Network: Re-useable try-catch block; call request.
  Future _makeGetRequest(Function request) async {
    try {
      return await request();
    } on SocketException catch (_) {
      throw 'Error whilst getting the data: no internet connection.';
    } on HttpException catch (_) {
      throw 'Error whilst getting the data: requested data could not be found.';
    } on FormatException catch (_) {
      throw 'Error whilst getting the data: bad format.';
    } on TimeoutException catch (_) {
      throw 'Error whilst getting the data: connection timed out.';
    } catch (err) {
      throw 'An error occurred whilst fetching the requested data: $err';
    }
  }
}
