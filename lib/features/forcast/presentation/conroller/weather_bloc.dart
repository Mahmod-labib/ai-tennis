import 'package:ai_tennis/features/forcast/data/models/prediction_model.dart';
import 'package:ai_tennis/features/forcast/domain/entities/forecast.dart';
import 'package:ai_tennis/features/forcast/domain/use_cases/get_forecast.dart';
import 'package:ai_tennis/features/forcast/domain/use_cases/get_prediction_use_case.dart';
import 'package:ai_tennis/features/forcast/domain/use_cases/get_weather.dart';
import 'package:ai_tennis/features/forcast/presentation/conroller/weather_event.dart';
import 'package:ai_tennis/features/forcast/presentation/conroller/weather_state.dart';
import 'package:bloc/bloc.dart';
import 'package:ai_tennis/features/forcast/data/models/weather_model.dart';
import 'package:ai_tennis/features/forcast/data/models/forecast_model.dart';

import 'package:dartz/dartz.dart';
import 'package:ai_tennis/core/error/failure.dart';


class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeather getWeather;
  final GetForecast getForecast;
  final GetPredictionUseCase getPredictionUseCase;


  WeatherBloc( {
    required this.getPredictionUseCase,
    required this.getWeather,
    required this.getForecast,
  }) : super(WeatherInitial()) {
    on<GetWeatherEvent>((event, emit) async {
      emit(WeatherLoading());

      final Either<Failure, WeatherModel> failureOrWeather = await getWeather.execute(
          event.latitude,
          event.longitude
      );

      emit(failureOrWeather.fold(
            (failure) => WeatherError(message: _mapFailureToMessage(failure)),
            (weather) => WeatherLoaded(weather: weather),
      ));
    });

    on<GetForecastEvent>((event, emit) async {
      emit(WeatherLoading());

      final Either<Failure, List<ForecastModel>> failureOrForecast = await getForecast.execute(
          event.latitude,
          event.longitude
      );

      emit(failureOrForecast.fold(
            (failure) => WeatherError(message: _mapFailureToMessage(failure)),
            (forecast) => ForecastLoaded(forecast: forecast),
      ));
    });

    on<GetWeatherPredictionEvent>((event, emit) async {
      emit(WeatherLoading());

      try {
        WeatherPredictionModel weatherModel = WeatherPredictionModel(
          outlook: event.outlook,
          temperature: event.temperature,
          humidity: event.humidity, windSpeed: event.windSpeed, uvIndex: event.uvIndex,
        );

        List<int> features = weatherModel.toFeatures();
        final result = await getPredictionUseCase.execute(features);

        result.fold(
              (error) => emit(const WeatherError(message: "Failed to get prediction")),
              (prediction) => emit(WeatherPredictionLoaded(prediction.prediction)),
        );
      } catch (e) {
        emit(WeatherError(message: '$e'));
      }
    });

  }



  String _mapFailureToMessage(Failure failure) {
    if (failure is ServerFailure) {
      return 'Server Failure';
    } else {
      return 'Unexpected Error';
    }

  }
}
