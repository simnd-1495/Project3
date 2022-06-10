import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project3/colors.dart';
import 'package:project3/viewmodel/weather_viewmodel.dart';
import 'package:project3/widget.dart/top_bar_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    scheduleMicrotask(() {
      context.read<WeatherViewModel>().getWeather(lon: 139, lat: 35);
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          color: Colors.white,
          child: Consumer<WeatherViewModel>(
            builder: (context, viewmodel, child) {
              if (viewmodel.loading) {
                return Center(
                  child: Container(
                    color: Colors.white,
                    child: const CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  ),
                );
              }
              return Column(
                children: [
                  const TopBar(
                    iconLeft: Icons.menu,
                    iconRight: Icons.abc_outlined,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.location_on),
                      Consumer<WeatherViewModel>(
                        builder: ((context, viewmodel, child) {
                          final currentWeather = viewmodel.currentWeather;
                          if (currentWeather == null) {
                            return Container(child: const Text("data empty"));
                          }
                          return Text(viewmodel.currentWeather!.name);
                        }),
                      ),
                    ],
                  ),
                  Consumer<WeatherViewModel>(
                    builder: ((context, viewmodel, child) {
                      final currentWeather = viewmodel.currentWeather;
                      if (currentWeather == null) {
                        return Container(child: const Text("data empty"));
                      }
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        height: height * .7,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
                            ColorApp.malibu,
                            ColorApp.cornflowerBlue,
                          ]),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Image.network(
                              'http://openweathermap.org/img/wn/${currentWeather.weather?.first.icon ?? "03d"}@2x.png',
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              'Heavy Rain',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                            Text(
                              'today, 06 November',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              viewmodel.convertTemp(currentWeather.main.temp) + "°C",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 100,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.wind_power),
                                Text('Wind'),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  color: Colors.white,
                                  width: 1,
                                  height: double.infinity,
                                ),
                                Text('${currentWeather.wind.speed.toString()} km/h')
                              ],
                            ),
                            Divider(
                              thickness: 1,
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
