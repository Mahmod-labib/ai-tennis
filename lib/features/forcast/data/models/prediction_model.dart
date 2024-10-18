import 'package:equatable/equatable.dart';

class WeatherPredictionModel extends Equatable {
  final String outlook;
  final String temperature;
  final String humidity;
  final String windSpeed;
  final String uvIndex;

  const WeatherPredictionModel({
    required this.outlook,
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
    required this.uvIndex,
  });

  List<int> toFeatures() {
    List<int> features = [0, 0, 0, 0, 0, 0, 0];

    if (outlook == "rainy") {
      features[0] = 1;
    } else if (outlook == "sunny") {
      features[1] = 1;
    }

    if (temperature == "hot") {
      features[2] = 1;
    } else if (temperature == "mild") {
      features[3] = 1;
    }

    if (humidity == "normal") {
      features[4] = 1;
    }

    if (windSpeed == "strong") {
      features[5] = 1;
    }

    if (uvIndex == "high") {
      features[6] = 1;
    }

    return features;
  }

  @override
  List<Object> get props => [outlook, temperature, humidity, windSpeed, uvIndex];  // Add new fields to props
}
