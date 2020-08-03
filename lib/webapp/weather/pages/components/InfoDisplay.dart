import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webdemo/webapp/weather/model/WeatherProvider.dart';

class InfoDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WeatherProvider weatherProvider = Provider.of(context);
    var highest = weatherProvider.currentWeather?.tempMax?.celsius?.toInt();
    var lowest = weatherProvider.currentWeather?.tempMin?.celsius?.toInt();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "最高温度:$highest°C 最低温度:$lowest°C",
          style: TextStyle(color: Colors.white),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${weatherProvider.currentWeather?.temperature?.celsius?.toInt()}",
              style: TextStyle(color: Colors.white, fontSize: 100),
            ),
            Text(
              "°C",
              style: TextStyle(fontSize: 30, color: Colors.white),
            )
          ],
        ),
        Text(
          "体感温度: ${weatherProvider.currentWeather?.tempFeelsLike?.celsius?.toInt()}",
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
