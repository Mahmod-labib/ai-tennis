import 'package:ai_tennis/features/forcast/domain/entities/prediction.dart';
import 'package:ai_tennis/features/forcast/domain/repository/prediction.dart';
import 'package:dartz/dartz.dart';


class GetPredictionUseCase {
  final WeatherPredictionRepository repository;

  GetPredictionUseCase(this.repository);

  Future<Either<Exception, WeatherPrediction>> execute(List<int> features) async {
    return await repository.getPrediction(features);
  }
}
