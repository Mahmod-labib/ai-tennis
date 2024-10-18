import 'day_model.dart';
import 'astro_model.dart';
import 'hour_model.dart';

class ForecastDayModel {
  final String date;
  final int dateEpoch;
  final DayModel day;
  final AstroModel astro;
  final List<HourModel> hour;

  ForecastDayModel({
    required this.date,
    required this.dateEpoch,
    required this.day,
    required this.astro,
    required this.hour,
  });

  factory ForecastDayModel.fromJson(Map<String, dynamic> json) {
    return ForecastDayModel(
      date: json['date'] ?? 'Unknown',  // Fallback to 'Unknown' if null
      dateEpoch: json['date_epoch'] ?? 0,  // Fallback to 0 if null
      day: DayModel.fromJson(json['day'] ?? {}),  // Fallback to an empty map if null
      astro: AstroModel.fromJson(json['astro'] ?? {}),  // Fallback to an empty map if null
      hour: (json['hour'] as List?)
          ?.map((i) => HourModel.fromJson(i ?? {}))
          .toList() ?? [],  // Fallback to an empty list and map if null
    );
  }
}
