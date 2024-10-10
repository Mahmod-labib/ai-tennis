import 'package:ai_tennis/features/authencation/data/data_source/firebase_remote_data_source.dart';
import 'package:ai_tennis/features/authencation/data/repository/firebase_auth_repository.dart';
import 'package:ai_tennis/features/authencation/domain/repository/auth_repository.dart';
import 'package:ai_tennis/features/authencation/domain/use_case/login_use_case.dart';
import 'package:ai_tennis/features/authencation/domain/use_case/register_use_case.dart';
import 'package:ai_tennis/features/authencation/presentation/controller/auth_bloc.dart';
import 'package:ai_tennis/features/forcast/data/data_source/weather_remote_data_source.dart';
import 'package:ai_tennis/features/forcast/data/repository/weather_repository_impl.dart';
import 'package:ai_tennis/features/forcast/domain/repository/weather_repository.dart';
import 'package:ai_tennis/features/forcast/domain/use_cases/get_forecast.dart';
import 'package:ai_tennis/features/forcast/domain/use_cases/get_weather.dart';
import 'package:ai_tennis/features/home/data/repository/location_repository.dart';
import 'package:ai_tennis/features/home/domain/repository/location_repository.dart';
import 'package:ai_tennis/features/home/domain/use_cases/get_location_use_case.dart';
import 'package:ai_tennis/features/home/presentation/controller/get_location/get_location_bloc.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(() => AuthBloc(
      loginUseCase: sl(),
      registerUseCase: sl(),


  ));

  // Weather
  sl.registerFactory(() => GetLocationBloc(
    getCurrentLocationUseCase: sl(),
  ));


  // Use cases
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => RegisterUseCase(sl()));
  sl.registerLazySingleton(() => GetCurrentLocationUseCase(sl()));
  sl.registerLazySingleton(() => GetWeather(sl<WeatherRepository>()));
  sl.registerLazySingleton(() => GetForecast(sl<WeatherRepository>()));
  // Repository
  sl.registerLazySingleton<AuthRepository>(
        () => FirebaseAuthRepository(sl()),
  );
  sl.registerLazySingleton<LocationRepository>(() => LocationRepositoryImpl());
  sl.registerLazySingleton<WeatherRepository>(
        () => WeatherRepositoryImpl(remoteDataSource: sl<WeatherRemoteDataSource>()),
  );

  // Data sources
  sl.registerLazySingleton<FirebaseRemoteDataSource>(
        () => FirebaseRemoteDataSource(firebaseAuth: sl()),
  );
  sl.registerLazySingleton<WeatherRemoteDataSource>(
        () => WeatherRemoteDataSourceImpl(sl<Dio>()),
  );
  // External (Firebase Auth)
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  sl.registerLazySingleton<Dio>(() => Dio());

}