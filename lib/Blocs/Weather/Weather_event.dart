import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

@immutable
abstract class WeatherEvent extends Equatable {
  WeatherEvent([List props = const []]) : super(props);
}

class GetWeather extends WeatherEvent {
  GetWeather({@required this.cityName})
      : assert(cityName != null),
        super([cityName]);
  final String cityName;
}
