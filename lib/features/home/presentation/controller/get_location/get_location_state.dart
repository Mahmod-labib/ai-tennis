import 'package:ai_tennis/features/home/domain/entities/location.dart';

abstract class GetLocationState {}

class GetLocationInitial extends GetLocationState {}

class GetLocationLoading extends GetLocationState {}

class FullNameLoaded extends GetLocationState {
  final String fullName;

  FullNameLoaded(this.fullName);
}

class LocationLoaded extends GetLocationState {
  final Location location;

  LocationLoaded(this.location);
}

class GetLocationError extends GetLocationState {
  final String message;

  GetLocationError(this.message);
}
