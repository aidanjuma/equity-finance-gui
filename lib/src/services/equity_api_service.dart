import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
// Local
import 'package:equity/src/types/currency.dart';
import 'package:equity/src/models/google_news.dart';
import 'package:equity/src/models/currency_data.dart';

class EquityApiService {
  final Client _client = Client();

  static const String _baseUrl =
      'http://127.0.0.1:3000'; // localhost; adjust accordingly
  static const String _binanceEndpoint = '$_baseUrl/fiat/binance';
  static const String _googleFinanceEndpoint = '$_baseUrl/fiat/google';

  /* Google Finance */

  // Scrape News from Home.
  Future<List<GoogleNews>> scrapeNewsFromGoogleFinance() async {
    final Uri url = Uri.parse('$_baseUrl/news');

    final List<dynamic> results = await _makeGetRequest(() async {
      Response response = await _client.get(url);
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final List<dynamic> results = data['result'];
      return results;
    });

    List<GoogleNews> articles = _parseNewsArticles(results);

    return articles;
  }

  // Parse news from GFI into GoogleNews objects.
  List<GoogleNews> _parseNewsArticles(List<dynamic> googleNews) {
    // Add each news article to a list.
    List<GoogleNews> news = [];
    for (int i = 0; i < googleNews.length; i++) {
      final item = googleNews[i];
      final GoogleNews article = GoogleNews(
        link: item['link'],
        sourceName: item['source'],
        title: item['title'],
        thumbnailUrl: item['thumbnail'],
        whenPublished: item['published'],
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
