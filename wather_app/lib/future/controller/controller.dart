import 'package:flutter/material.dart';

class Controller with ChangeNotifier{
  String _city = '';
  final List<double> _temperature = [23, 19, 18, 21, 20];

  String get getCity => _city;
  List<double> get getTemperature => _temperature;

  void changeCity(String newCity){
    _city = newCity;
    notifyListeners();
  }

}