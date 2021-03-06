import 'package:flutter/material.dart';
import 'package:webdemo/webapp/countdown/main.dart';
import 'package:webdemo/webapp/weather/WeatherApp.dart';

class AppService {
  String path;
  Widget app;
  String title;
  IconData icon;
  String description;

  AppService({this.path, this.app, this.title, this.icon, this.description});

  toJson() => {
        "path": path,
        "title": title,
        "icon": icon,
        "description": description,
        "app": app,
      };
  factory AppService.fromJson(Map<String, dynamic> json) => AppService(
        app: json['app'],
        icon: json['icon'],
        title: json['title'],
        description: json['description'],
        path: json['path'],
      );
}

final List<AppService> apps = [
  AppService(
    app: CountdownApp(),
    path: "/countdown",
    title: "Count Down App",
    description: "一个倒计时App，支持网页与手机客户端",
    icon: Icons.date_range,
  ),
  AppService(
    app: WeatherApp(),
    path: "/weather",
    title: "Weather App",
    description: "一个可以看天气的App",
    icon: Icons.wb_sunny,
  ),
];
