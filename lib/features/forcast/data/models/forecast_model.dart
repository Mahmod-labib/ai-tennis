import 'package:ai_tennis/features/forcast/data/models/forecast_day_model.dart';

class ForecastModel {
  final List<ForecastDayModel> forecastDays;

  ForecastModel({required this.forecastDays});

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    return ForecastModel(
      forecastDays: (json['forecastday'] as List)
          .map((day) => ForecastDayModel.fromJson(day))
          .toList(),
    );
  }
}
