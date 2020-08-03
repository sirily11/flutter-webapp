import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webdemo/webapp/weather/model/WeatherProvider.dart';

class ForecastCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WeatherProvider weatherProvider = Provider.of(context);
    var rain = weatherProvider.currentWeather?.rainLast3Hours;
    var pressure = weatherProvider.currentWeather?.pressure;
    var humi = weatherProvider.currentWeather?.humidity;
    var sunrise = weatherProvider.currentWeather?.sunrise;
    var sunset = weatherProvider.currentWeather?.sunset;
    var wind = weatherProvider.currentWeather?.windSpeed;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoTile(
                title: "过去三小时降水",
                description: "$rain",
              ),
              InfoTile(
                title: "风速",
                description: "$wind",
              ),
              InfoTile(
                title: "压强",
                description: "$pressure",
              ),
              InfoTile(
                title: "湿度",
                description: "$humi",
              ),
              InfoTile(
                title: "日出时间",
                description: "$sunrise",
              ),
              InfoTile(
                title: "日落时间",
                description: "$sunset",
              )
            ],
          ),
        ),
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  final String title;
  final String description;

  InfoTile({this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            "$title",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Text("$description"),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Divider(),
        ),
      ],
    );
  }
}
