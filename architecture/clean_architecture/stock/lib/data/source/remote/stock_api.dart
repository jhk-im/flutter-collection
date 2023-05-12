import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class StockApi {
  static final baseUrl = dotenv.env['BASE_URL'];
  static final apiKey = dotenv.env['API_KEY'];
  final http.Client _client;

  StockApi({http.Client? client}) : _client = (client ?? http.Client());

  // https://www.alphavantage.co/query?function=LISTING_STATUS&apikey=demo
  Future<http.Response> getListings() async {
    var url = Uri.https(baseUrl ?? '', 'query', { 'function' : 'LISTING_STATUS', 'apikey' : apiKey ?? '' });
    return await _client.get(url);
  }
}