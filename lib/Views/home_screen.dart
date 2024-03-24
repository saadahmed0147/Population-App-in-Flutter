import 'package:population_app/Components/reusable_row.dart';
import 'package:population_app/Models/country_info_model.dart';
import 'package:population_app/Services/get_country_info.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:population_app/Utilities/routes_name.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  final colorList = const <Color>[
    Color(0xff4285F4),
    Color(0xff1aa260),
    Color(0xffde5246),
  ];
  @override
  Widget build(BuildContext context) {
    GetCountryInfo countryServices = GetCountryInfo();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('World Population'),
      ),
      body: SafeArea(
        child: FutureBuilder(
            future: countryServices
                .fetchCountryInfo(['china', 'india', 'united states']),
            builder:
                ((context, AsyncSnapshot<List<CountryInfoModel>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Column(
                  children: [
                    Expanded(
                        flex: 1,
                        child: SpinKitFadingCircle(
                          color: Colors.white,
                          size: MediaQuery.of(context).size.height * .063,
                          controller: _controller,
                        )),
                  ],
                );
              } else if (snapshot.hasError) {
                print(snapshot.error);
                return Text('Error occurred: ${snapshot.error}');
              } else {
                Map<String, double> dataMap = {
                  'China': 18.47,
                  'India': 17.70,
                  'United States': 4.19,
                  'Other countries': 60.65,
                };

                return Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: [
                      PieChart(
                        dataMap: dataMap,
                        chartType: ChartType.ring,
                        chartRadius: MediaQuery.of(context).size.width / 3.2,
                        legendOptions: const LegendOptions(
                          legendPosition: LegendPosition.left,
                          legendTextStyle: TextStyle(
                            fontSize: 15,
                            decoration: TextDecoration.none,
                            color: Colors.white,
                          ),
                        ),
                        animationDuration: const Duration(milliseconds: 1200),
                        colorList: colorList,
                      ),
                      const Spacer(),
                      Card(
                        child: Column(
                          children: [
                            for (var countryInfo in snapshot.data!)
                              ReusableRow(
                                  title: countryInfo.name!.common!,
                                  value: countryInfo.population!.toString()),
                            const ReusableRow(
                                title: 'Other Countries', value: '4797694643')
                          ],
                        ),
                      ),
                      const Spacer(),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, RouteName.countriesSearchScreen);
                        },
                        icon: const Icon(Icons.public),
                        style: const ButtonStyle(
                            foregroundColor:
                                MaterialStatePropertyAll(Colors.white),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.green)),
                        label: const Text(
                          'Track Countries',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                );
              }
            })),
      ),
    );
  }
}
