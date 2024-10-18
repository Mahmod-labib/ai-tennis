import 'package:ai_tennis/features/forcast/domain/repository/prediction.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/prediction.dart';
import '../data_source/prediction.dart';


class WeatherPredictionRepositoryImpl implements WeatherPredictionRepository {
  final WeatherPredictionRemoteDataSource remoteDataSource;

  WeatherPredictionRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Exception, WeatherPrediction>> getPrediction(List<int> features) async {
    try {
      final prediction = await remoteDataSource.getPrediction(features);
      return Right(WeatherPrediction(prediction));
    } catch (e) {
      return Left(Exception('Failed to fetch prediction'));
    }
  }
}
