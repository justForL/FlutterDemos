import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class WeatherState extends Equatable {
  WeatherState(this.cityName, [List props = const []]) : super(props);
final  String cityName;
  /// Copy object for use in action
  WeatherState getStateCopy();
}

class InitState extends WeatherState {
  InitState() : super("");

  @override
  WeatherState getStateCopy() => InitState();
}

class LoadState extends WeatherState {
  LoadState() : super("Loaded");

  @override
  WeatherState getStateCopy() => LoadState();
}

class LoadedState extends WeatherState {
  

  LoadedState(cityName) :assert(cityName != null),super(cityName);
  @override
  WeatherState getStateCopy() => LoadedState(this.cityName); 
}