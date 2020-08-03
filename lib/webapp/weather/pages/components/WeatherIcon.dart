import 'package:flutter/material.dart';

class WeatherIcon extends StatelessWidget {
  final String weather;
  final String weatherDescription;

  WeatherIcon({@required this.weather, this.weatherDescription});

  Icon _getWeatherIcon() {
    final double size = 100;

    switch (weather) {
      case "Rain":
        return Icon(
          Icons.beach_access,
          size: size,
          color: Colors.white,
        );

      default:
        return Icon(
          Icons.wb_sunny,
          size: size,
          color: Colors.yellow,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _getWeatherIcon(),
          Text(
            weatherDescription,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
