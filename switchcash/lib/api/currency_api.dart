// lib/services/currency_api.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CurrencyApi {
  final http.Client client;

  CurrencyApi({http.Client? client}) : client = client ?? http.Client();

  final String _apikey = dotenv.env['API_KEY'] ?? '';
  final String _baseUrl = dotenv.env['API_BASE_URL'] ?? '';


  Future<Map<String, dynamic>> getCurrencyRates() async {
    final response = await client.get(
      Uri.parse("$_baseUrl?apikey=$_apikey"),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load currency');
    }
  }
}
