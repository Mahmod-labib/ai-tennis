import 'package:equatable/equatable.dart';

class WeatherPrediction extends Equatable {
  final int prediction;

  const WeatherPrediction(this.prediction);

  @override
  List<Object> get props => [prediction];
}
