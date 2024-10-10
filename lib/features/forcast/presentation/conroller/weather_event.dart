import 'package:equatable/equatable.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object?> get props => [];
}

class GetWeatherEvent extends WeatherEvent {
  final double latitude;
  final double longitude;

  const GetWeatherEvent({required this.latitude, required this.longitude});

  @override
  List<Object?> get props => [latitude, longitude];
}

class GetForecastEvent extends WeatherEvent {
  final double latitude;
  final double longitude;

  const GetForecastEvent({required this.latitude, required this.longitude});

  @override
  List<Object?> get props => [latitude, longitude];
}