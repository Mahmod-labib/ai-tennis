import 'package:equatable/equatable.dart';

class ForecastEntity extends Equatable {
  final String date;
  final double maxTemp;
  final double minTemp;
  final String condition;

  const ForecastEntity({
    required this.date,
    required this.maxTemp,
    required this.minTemp,
    required this.condition,
  });

  @override
  List<Object?> get props => [date, maxTemp, minTemp, condition];
}
