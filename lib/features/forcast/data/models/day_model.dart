import 'condition_model.dart';

class DayModel {
  final double maxtempC;
  final double maxtempF;
  final double mintempC;
  final double mintempF;
  final double avgtempC;
  final double avgtempF;
  final double maxwindMph;
  final double maxwindKph;
  final double totalPrecipMm;
  final double totalPrecipIn;
  final double avgVisKm;
  final double avgVisMiles;
  final int avgHumidity;
  final int dailyWillItRain;
  final int dailyChanceOfRain;
  final int dailyWillItSnow;
  final int dailyChanceOfSnow;
  final ConditionModel condition;
  final double uv;

  DayModel({
    required this.maxtempC,
    required this.maxtempF,
    required this.mintempC,
    required this.mintempF,
    required this.avgtempC,
    required this.avgtempF,
    required this.maxwindMph,
    required this.maxwindKph,
    required this.totalPrecipMm,
    required this.totalPrecipIn,
    required this.avgVisKm,
    required this.avgVisMiles,
    required this.avgHumidity,
    required this.dailyWillItRain,
    required this.dailyChanceOfRain,
    required this.dailyWillItSnow,
    required this.dailyChanceOfSnow,
    required this.condition,
    required this.uv,
  });

  factory DayModel.fromJson(Map<String, dynamic> json) {
    return DayModel(
      maxtempC: json['maxtemp_c'].toDouble(),
      maxtempF: json['maxtemp_f'].toDouble(),
      mintempC: json['mintemp_c'].toDouble(),
      mintempF: json['mintemp_f'].toDouble(),
      avgtempC: json['avgtemp_c'].toDouble(),
      avgtempF: json['avgtemp_f'].toDouble(),
      maxwindMph: json['maxwind_mph'].toDouble(),
      maxwindKph: json['maxwind_kph'].toDouble(),
      totalPrecipMm: json['total_precip_mm'].toDouble(),
      totalPrecipIn: json['total_precip_in'].toDouble(),
      avgVisKm: json['avgvis_km'].toDouble(),
      avgVisMiles: json['avgvis_miles'].toDouble(),
      avgHumidity: json['avghumidity'],
      dailyWillItRain: json['daily_will_it_rain'],
      dailyChanceOfRain: json['daily_chance_of_rain'],
      dailyWillItSnow: json['daily_will_it_snow'],
      dailyChanceOfSnow: json['daily_chance_of_snow'],
      condition: ConditionModel.fromJson(json['condition']),
      uv: json['uv'].toDouble(),
    );
  }
}
