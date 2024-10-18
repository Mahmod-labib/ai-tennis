import 'package:ai_tennis/features/forcast/data/models/forecast_day_model.dart';
import 'package:ai_tennis/features/forcast/domain/entities/forecast.dart';
import 'package:equatable/equatable.dart';
import 'package:ai_tennis/features/forcast/data/models/weather_model.dart';
import 'package:ai_tennis/features/forcast/data/models/forecast_model.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object?> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherModel weather;

  const WeatherLoaded({required this.weather});

  @override
  List<Object?> get props => [weather];
}

class ForecastLoaded extends WeatherState {
  final List<ForecastModel> forecast;

  const ForecastLoaded({required this.forecast});

  @override
  List<Object?> get props => [forecast];
}


class WeatherError extends WeatherState {
  final String message;

  const WeatherError({required this.message});

  @override
  List<Object?> get props => [message];
}

class WeatherPredictionLoaded extends WeatherState {
  final int prediction;

  const WeatherPredictionLoaded(this.prediction);

  @override
  List<Object> get props => [prediction];
}
