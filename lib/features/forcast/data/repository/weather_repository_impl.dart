import 'package:ai_tennis/core/error/exception.dart';
import 'package:ai_tennis/core/error/failure.dart';
import 'package:ai_tennis/features/forcast/data/data_source/weather_remote_data_source.dart';
import 'package:ai_tennis/features/forcast/data/models/forecast_model.dart';
import 'package:ai_tennis/features/forcast/data/models/weather_model.dart';
import 'package:ai_tennis/features/forcast/domain/entities/forecast.dart';
import 'package:ai_tennis/features/forcast/domain/entities/weather.dart';
import 'package:ai_tennis/features/forcast/domain/repository/weather_repository.dart';
import 'package:dartz/dartz.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;

  WeatherRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, WeatherModel>> getWeather(double lat, double lon) async {
    try {
      final weatherModel = await remoteDataSource.getWeather(lat, lon);
      return Right(weatherModel);  // Assuming WeatherModel extends WeatherEntity
    } on ServerException {
      return const Left(ServerFailure('Failed to fetch weather data from server'));
    }
  }

  @override
  Future<Either<Failure, List<ForecastModel>>> getForecast(double lat, double lon) async {
    try {
      final forecastModels = await remoteDataSource.getForecast(lat, lon);
      return Right(forecastModels);  // Assuming ForecastModel extends ForecastEntity
    } on ServerException {
      return const Left(ServerFailure('Failed to fetch forecast data from server'));
    }
  }
}
