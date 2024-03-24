import 'dart:convert';

import 'package:population_app/Models/country_info_model.dart';
import 'package:http/http.dart' as http;

class GetCountryInfo {
  Future<List<CountryInfoModel>> fetchCountryInfo(
      List<String> countryNames) async {
    List<CountryInfoModel> countryInfoList = [];

    for (String name in countryNames) {
      final response = await http.get(
        Uri.parse('https://restcountries.com/v3.1/name/$name?fullText=true'),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        for (Map<String, dynamic> i in data) {
          countryInfoList.add(CountryInfoModel.fromJson(i));
        }
      } else {
        throw Exception('Failed to load data for $name');
      }
    }

    return countryInfoList;
  }
}
