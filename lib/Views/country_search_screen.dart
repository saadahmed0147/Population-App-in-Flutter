import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:population_app/Models/country_info_model.dart';
import 'package:population_app/Services/get_countries_info.dart';
import 'package:population_app/Views/country_details_screen.dart';

class CountrySearchScreen extends StatefulWidget {
  const CountrySearchScreen({super.key});

  @override
  State<CountrySearchScreen> createState() => _CountrySearchScreenState();
}

class _CountrySearchScreenState extends State<CountrySearchScreen> {
  List<CountryInfoModel> countries = [];
  bool isDataLoaded = false;

  CountryInfoModel? selectedCountry;

  TextEditingController searchController = TextEditingController();

  List<CountryInfoModel> getFilteredCountry(e) {
    return countries.where((country) {
      final name = country.name!.common!.toLowerCase();
      return name.contains(e.toLowerCase());
    }).toList();
  }

  Future<void> getCountries() async {
    try {
      List<Map<String, dynamic>> fetchedData = await CountryService.fetchData();
      List<CountryInfoModel> countryModels =
          fetchedData.map((map) => CountryInfoModel.fromJson(map)).toList();
      setState(() {
        countries = countryModels;
      });
      isDataLoaded = true;
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: true,
          title: const Text('Countries List'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                cursorColor: Colors.white,
                controller: searchController,
                decoration: InputDecoration(
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  labelText: 'Search Country',
                  labelStyle: const TextStyle(color: Colors.white),
                  suffixIcon: IconButton(
                    onPressed: () {
                      searchController.clear();
                      setState(() {
                        selectedCountry = null;
                      });
                    },
                    icon: const Icon(Icons.clear),
                  ),
                ),
                onChanged: (value) {
                  setState(() {});
                },
              ),
              Expanded(
                child: isDataLoaded
                    ? ListView.builder(
                        itemCount:
                            getFilteredCountry(searchController.text).length,
                        itemBuilder: (context, index) {
                          final country =
                              getFilteredCountry(searchController.text)[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 25,
                                backgroundImage:
                                    NetworkImage(country.flags!.png.toString()),
                              ),
                              title: Text(
                                country.name!.common.toString(),
                              ),
                              onTap: () {
                                setState(() {
                                  selectedCountry = country;
                                });
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CountryDetailsScreen(
                                              flag:
                                                  country.flags!.png.toString(),
                                              countryName: country.name!.common
                                                  .toString(),
                                              population:
                                                  country.population.toString(),
                                            )));
                              },
                            ),
                          );
                        },
                      )
                    : const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
              ),
            ],
          ),
        ));
  }
}
