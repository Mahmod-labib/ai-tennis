import 'package:equatable/equatable.dart';

abstract class GetLocationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadFullName extends GetLocationEvent {}

class LoadCurrentLocation extends GetLocationEvent {}
