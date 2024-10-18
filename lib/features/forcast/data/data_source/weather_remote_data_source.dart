import 'package:ai_tennis/core/error/exception.dart';
import 'package:ai_tennis/core/utils/api_constants.dart';
import 'package:ai_tennis/features/forcast/domain/entities/forecast.dart';
import 'package:dio/dio.dart';
import 'package:ai_tennis/features/forcast/data/models/forecast_model.dart';
import 'package:ai_tennis/features/forcast/data/models/weather_model.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getWeather(double lat, double lon);
  Future<List<ForecastModel>> getForecast(double lat, double lon);
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final Dio dio;

  WeatherRemoteDataSourceImpl(this.dio);


  @override
  Future<WeatherModel> getWeather(double lat, double lon) async {
    try {
      final response = await dio.get(
        'https://api.weatherapi.com/v1/current.json',
        queryParameters: {
          'key': ApiConstants.apiKey,
          'q': '$lat,$lon',
        },
      );

      if (response.statusCode == 200) {
        return WeatherModel.fromJson(response.data);
      } else {
        print('Error: ${response.statusCode} - ${response.data}');
        throw ServerException();  // This should be caught by your repository later
      }
    } catch (error) {
      print('Request error: $error');
      throw ServerException();
    }
  }

  @override
  Future<List<ForecastModel>> getForecast(double lat, double lon) async {
    try {
      final response = await dio.get(
        'https://api.weatherapi.com/v1/forecast.json',
        queryParameters: {
          'key': ApiConstants.apiKey,  // Ensure your API key is valid.
          'q': '$lat,$lon',
          'days': 7,
        },
      );

      if (response.statusCode == 200) {
        return (response.data['forecast']['forecastday'] as List)
            .map((forecast) => ForecastModel.fromJson(forecast))
            .toList();
      } else {
        // Log the error for better debugging
        print('Error: ${response.statusCode} - ${response.data}');
        throw ServerException();
      }
    } catch (error) {
      print('Request error: $error');
      throw ServerException();
    }
  }
}