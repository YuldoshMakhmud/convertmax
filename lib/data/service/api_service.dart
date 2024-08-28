import 'dart:convert';
import 'package:convermax/data/model/currency.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl =
      'https://nbu.uz/en/exchange-rates/json/'; // API manzili

  // Ma'lumotlarni olish funksiyasi
  Future<List<Currency>> fetchCurrencies() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      // JSON dan ma'lumotlarni olish
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Currency.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load currencies');
    }
  }
}
