import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webdemo/pages/CustomAppBar.dart';
import 'package:webdemo/webapp/weather/model/WeatherProvider.dart';
import 'package:webdemo/webapp/weather/pages/components/ForecastCards.dart';
import 'package:webdemo/webapp/weather/pages/components/InfoDisplay.dart';
import 'package:webdemo/webapp/weather/pages/components/WeatherIcon.dart';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    WeatherProvider weatherProvider = Provider.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        titleText: "Weather App: ${weatherProvider.currentWeather?.areaName}",
        icon: Icon(Icons.wb_sunny),
      ),
      backgroundColor: Colors.blue,
      body: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        child: weatherProvider.isLoading
            ? Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InfoDisplay(),
                        WeatherIcon(
                          weather: weatherProvider.currentWeather?.weatherMain,
                          weatherDescription: weatherProvider
                              .currentWeather?.weatherDescription,
                        ),
                      ],
                    ),
                    ForecastCard(),
                  ],
                ),
              ),
      ),
    );
  }
}
