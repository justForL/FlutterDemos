import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:demo02/Blocs/Weather/index.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  static final WeatherBloc _weatherBlocSingleton = new WeatherBloc._internal();
  factory WeatherBloc() {
    return _weatherBlocSingleton;
  }
  WeatherBloc._internal();

  WeatherState get initialState => new InitState();

  @override
  void onTransition(Transition<WeatherEvent, WeatherState> transition) {
    super.onTransition(transition);
    print(transition);
  }

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is GetWeather) {
      yield LoadState();
      Future<Null> result = await Future.delayed(Duration(seconds: 2));
    yield LoadedState(event.cityName);
      // _mapGetWeatherToState(event);
    }
  }

  Stream<LoadedState> _mapGetWeatherToState(GetWeather event) async* {
    
  }
}
