import 'package:flutter/material.dart';
import 'package:webdemo/apps.dart';

class MainAppProvider with ChangeNotifier {
  AppService _appService;
  AppService prevAppService;

  set appService(AppService app) {
    prevAppService =
        _appService != null ? AppService.fromJson(_appService.toJson()) : null;
    _appService = app;
    notifyListeners();
  }

  AppService get appService => _appService;
}
