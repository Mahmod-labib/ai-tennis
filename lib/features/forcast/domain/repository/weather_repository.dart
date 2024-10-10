import 'package:ai_tennis/features/forcast/data/models/forecast_model.dart';
import 'package:ai_tennis/features/forcast/data/models/weather_model.dart';
import 'package:ai_tennis/features/forcast/domain/entities/forecast.dart';
import 'package:ai_tennis/features/forcast/domain/entities/weather.dart';
import 'package:dartz/dartz.dart';
import 'package:ai_tennis/core/error/failure.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherModel>> getWeather(double lat, double lon);
  Future<Either<Failure, List<ForecastModel>>> getForecast(double lat, double lon);
}
