import 'package:flutter/material.dart';
import 'package:population_app/Components/reusable_row.dart';

class CountryDetailsScreen extends StatefulWidget {
  final String countryName;
  final String population;
  final String flag;
  const CountryDetailsScreen({
    super.key,
    this.countryName = '',
    this.population = '',
    this.flag = '',
  });

  @override
  State<CountryDetailsScreen> createState() => _CountryDetailsScreenState();
}

class _CountryDetailsScreenState extends State<CountryDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: const Text('Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.2,
                  horizontal: 10),
              child: Card(
                elevation: 5,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(50),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(widget.flag),
                        radius: 50,
                      ),
                    ),
                    ReusableRow(
                        title: 'Country Name', value: widget.countryName),
                    ReusableRow(title: 'Population', value: widget.population),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
