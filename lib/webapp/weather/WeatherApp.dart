import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webdemo/webapp/weather/model/WeatherProvider.dart';
import 'package:webdemo/webapp/weather/pages/WeatherPage.dart';

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => WeatherProvider(),
          )
        ],
        child: Material(
          child: WeatherPage(),
        ),
      ),
    );
  }
}
