
import 'package:ai_tennis/features/forcast/data/models/forecast_model.dart';
import 'package:ai_tennis/features/forcast/domain/entities/forecast.dart';
import 'package:ai_tennis/features/forcast/domain/repository/weather_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:ai_tennis/core/error/failure.dart';

class GetForecast {
  final WeatherRepository repository;

  GetForecast(this.repository);

  Future<Either<Failure, List<ForecastModel>>> execute(double lat, double lon) async {
    return await repository.getForecast(lat, lon);
  }
}
