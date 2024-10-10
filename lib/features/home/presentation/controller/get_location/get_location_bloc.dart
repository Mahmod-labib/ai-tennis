import 'package:ai_tennis/features/home/domain/use_cases/get_location_use_case.dart';
import 'package:ai_tennis/features/home/presentation/controller/get_location/get_location_event.dart';
import 'package:ai_tennis/features/home/presentation/controller/get_location/get_location_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetLocationBloc extends Bloc<GetLocationEvent, GetLocationState> {
  final GetCurrentLocationUseCase getCurrentLocationUseCase;

  GetLocationBloc({required this.getCurrentLocationUseCase}) : super(GetLocationInitial()) {
    on<LoadFullName>(_onLoadFullName);
    on<LoadCurrentLocation>(_onLoadCurrentLocation);
  }

  Future<void> _onLoadFullName(
      LoadFullName event, Emitter<GetLocationState> emit) async {
    emit(GetLocationLoading());
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final fullName = prefs.getString('fullName') ?? 'No user data found';
      emit(FullNameLoaded(fullName));
    } catch (e) {
      emit(GetLocationError('Failed to load user data'));
    }
  }

  Future<void> _onLoadCurrentLocation(
      LoadCurrentLocation event, Emitter<GetLocationState> emit) async {
    emit(GetLocationLoading());
    try {
      final location = await getCurrentLocationUseCase();
      emit(LocationLoaded(location));
    } catch (e) {
      emit(GetLocationError('Failed to load current location'));
    }
  }
}
