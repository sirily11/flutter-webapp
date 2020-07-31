import 'package:flutter/material.dart';
import 'package:webdemo/webapp/countdown/main.dart';

class AppService {
  String path;
  Widget app;
  String title;
  IconData icon;
  String description;

  AppService({this.path, this.app, this.title, this.icon, this.description});
}

final List<AppService> apps = [
  AppService(
    app: CountdownApp(),
    path: "/countdown",
    title: "Count Down App",
    description: "一个倒计时App，支持网页与手机客户端",
    icon: Icons.date_range,
  ),
];
