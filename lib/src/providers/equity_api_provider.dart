import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
// Local
import 'package:equity/src/types/currency.dart';
import 'package:equity/src/models/currency_data.dart';
import 'package:equity/src/models/google_news.dart';

class EquityApiProvider {
  final Client _client = Client();

  // Endpoints
  static const String baseUrl = 'http://192.168.1.64:5001'; // localhost
  static const String googleEndpoint = '$baseUrl/google';

  /* .../google/news */
  Future<List<GoogleNews>> getNewsFromGoogle() async {
    final Uri url = Uri.parse('$baseUrl/google/news');

    final List<dynamic> results = await _makeGetRequest(() async {
      Response response = await _client.get(url);
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final List<dynamic> results = data['result'];
      return results;
    });

    List<GoogleNews> news = _handleGoogleNews(results);

    return news;
  }

  /* .../google/data/currency?base=XXX&quote=YYY */
  Future<CurrencyData> getCurrencyDataFromGoogle(
      Currency base, Currency quote) async {
    final Uri url = Uri.parse(
        '$googleEndpoint/data/currency?base=${base.toString().split('.').last}&quote=${quote.toString().split('.').last}');

    final Map<String, dynamic> results = await _makeGetRequest(() async {
      Response response = await _client.get(url);
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final Map<String, dynamic> results = data['result'];
      return results;
    });

    CurrencyData currencyData = CurrencyData(
      baseCurrency: base,
      quoteCurrency: quote,
      price: results['price'],
      news: _handleGoogleNews(results['news']),
    );

    return currencyData;
  }

  List<GoogleNews> _handleGoogleNews(List<dynamic> googleNews) {
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
