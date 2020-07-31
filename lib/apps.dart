import 'package:flutter/material.dart';
import 'package:webdemo/webapp/countdown/main.dart';

class AppService {
  String path;
  Widget app;
  String title;

  AppService({this.path, this.app, this.title});
}

final List<AppService> apps = [
  AppService(
    app: CountdownApp(),
    path: "/countdown",
    title: "Count Down App",
  ),
];
