import 'package:ai_tennis/features/forcast/domain/entities/forecast.dart';
import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
  final String name;
  final String region;
  final String country;
  final double latitude;
  final double longitude;
  final String condition;
  final double temperature;
  final List<ForecastEntity> forecast;

  const WeatherEntity({
    required this.name,
    required this.region,
    required this.country,
    required this.latitude,
    required this.longitude,
    required this.condition,
    required this.temperature,
    required this.forecast,
  });

  @override
  List<Object?> get props => [name, region, country, latitude, longitude, condition, temperature, forecast];
}

