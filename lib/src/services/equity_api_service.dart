import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
// Local
import 'package:equity/src/types/currency.dart';
import 'package:equity/src/models/currency_data.dart';
import 'package:equity/src/models/market_stories.dart';
import 'package:equity/src/models/google_news_article.dart';

class EquityApiService {
  final Client _client = Client();

  static const String _baseUrl = 'http://192.168.1.225:3000';
  static const String _binanceEndpoint = '$_baseUrl/fiat/binance';
  static const String _googleFinanceEndpoint = '$_baseUrl/fiat/google';

  /* Google Finance */
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
