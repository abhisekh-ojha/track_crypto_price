import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const apiKey = 'PASTE_YOUR_API_KEY_HERE';
const baseURL = 'https://rest.coinapi.io/v1/exchangerate';

class CoinData {

  Future getBTCPrice(String selectedCurrency) async {

    var cryptoPrices = [];

    for (String crypto in cryptoList) {

      http.Response response = await http.get(
        Uri.parse('$baseURL/$crypto/$selectedCurrency?apikey=${apiKey}'),
      );

      if (response.statusCode == 200) {
        // dart convert function jsonDecode to decode the raw data
        var decodedData = jsonDecode(response.body);
        var lastPrice = decodedData['rate'];
        cryptoPrices.add(lastPrice.toStringAsFixed(2));

      }
      else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
    return cryptoPrices;
  }

}