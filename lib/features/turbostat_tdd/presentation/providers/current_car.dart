import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turbostat_app/core/error/exception.dart';
import 'package:turbostat_app/features/turbostat_tdd/data/models/car_model.dart';

class CurrentCar extends ChangeNotifier {
  late CarModel _car;
  late SharedPreferences pref;

  CarModel get currentCar => _car;

  CurrentCar() {
    loadCarId();
  }

  void updateCurrentCar(CarModel car) {
    _car = car;
    notifyListeners();
  }

  Future<void> loadCarId() async {
    pref = await SharedPreferences.getInstance();
    final jsonString = pref.getString('carId');
    if (jsonString != null) {
      Map res = jsonDecode(pref.getString('carId')!);
      _car = CarModel.fromJson(res as Map<String, dynamic>);
      updateCurrentCar(_car);
    } else {
      throw CacheException();
    }
  }
}
