import 'package:flutter/material.dart';
import 'package:population_app/Utilities/routes_name.dart';
import 'package:population_app/Views/country_details_screen.dart';
import 'package:population_app/Views/country_search_screen.dart';
import 'package:population_app/Views/home_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.homeScreen:
        return MaterialPageRoute(builder: ((context) => const HomeScreen()));
      case RouteName.countriesSearchScreen:
        return MaterialPageRoute(builder: ((context) => CountrySearchScreen()));
      case RouteName.countryDetailScreen:
        return MaterialPageRoute(
            builder: ((context) => CountryDetailsScreen()));

      default:
        return MaterialPageRoute(builder: ((context) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        }));
    }
  }
}
