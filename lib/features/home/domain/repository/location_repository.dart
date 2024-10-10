import 'package:ai_tennis/features/home/domain/entities/location.dart';

abstract class LocationRepository {
  Future<Location> getCurrentLocation();
}
