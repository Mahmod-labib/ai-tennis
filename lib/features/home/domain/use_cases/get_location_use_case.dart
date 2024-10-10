import 'package:ai_tennis/features/home/domain/entities/location.dart';
import 'package:ai_tennis/features/home/domain/repository/location_repository.dart';

class GetCurrentLocationUseCase {
  final LocationRepository repository;

  GetCurrentLocationUseCase(this.repository);

  Future<Location> call() async {
    return await repository.getCurrentLocation();
  }
}
