import 'dart:convert';
import 'package:http/http.dart' as http;

class CountryService {
  static Future<List<Map<String, dynamic>>> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://restcountries.com/v3.1/all?fields=name%2Cflags%2Cpopulation'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return List<Map<String, dynamic>>.from(data);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
