import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:weather/weather.dart';
import 'package:webdemo/secrets/secrets.dart';

class WeatherProvider with ChangeNotifier {
  WeatherFactory wf;
  Weather currentWeather;
  bool isLoading = false;

  WeatherProvider() {
    wf = WeatherFactory(kWeatherAPIKey, language: Language.CHINESE_SIMPLIFIED);
    getCurrentLocationWeather();
  }

  Future<void> getCurrentLocationWeather() async {
    isLoading = true;
    notifyListeners();

    var locationData = await _getLocation();
    if (locationData != null) {
      currentWeather = await wf.currentWeatherByLocation(
        locationData.latitude,
        locationData.longitude,
      );
    }
    isLoading = false;
    notifyListeners();
  }

  Future<LocationData> _getLocation() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    _locationData = await location.getLocation();
    return _locationData;
  }
}
