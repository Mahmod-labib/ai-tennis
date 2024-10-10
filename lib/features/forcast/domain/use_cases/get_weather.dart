
import 'package:ai_tennis/features/forcast/data/models/weather_model.dart';
import 'package:ai_tennis/features/forcast/domain/repository/weather_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:ai_tennis/core/error/failure.dart';

class GetWeather {
  final WeatherRepository repository;

  GetWeather(this.repository);

  Future<Either<Failure, WeatherModel>> execute(double lat, double lon) async {
    return await repository.getWeather(lat, lon);
  }
}
