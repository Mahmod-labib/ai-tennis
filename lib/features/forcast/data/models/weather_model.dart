import 'forecast_model.dart';
import 'location_model.dart';
import 'current_weather_model.dart';

class WeatherModel {
  final LocationModel location;
  final CurrentWeatherModel current;
  final ForecastModel forecast;

  WeatherModel({required this.location, required this.current, required this.forecast});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      location: LocationModel.fromJson(json['location']),
      current: CurrentWeatherModel.fromJson(json['current']),
      forecast: ForecastModel.fromJson(json['forecast']),
    );
  }
}
