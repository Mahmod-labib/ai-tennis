import 'package:ai_tennis/features/forcast/domain/entities/prediction.dart';
import 'package:dartz/dartz.dart';

abstract class WeatherPredictionRepository {
  Future<Either<Exception, WeatherPrediction>> getPrediction(List<int> features);
}
