import 'package:ai_tennis/core/routes/navigation_services.dart';
import 'package:ai_tennis/core/routes/routes.dart';
import 'package:ai_tennis/core/services/services_locater.dart';
import 'package:ai_tennis/features/authencation/domain/use_case/login_use_case.dart';
import 'package:ai_tennis/features/authencation/domain/use_case/register_use_case.dart';
import 'package:ai_tennis/features/authencation/presentation/controller/auth_bloc.dart';
import 'package:ai_tennis/features/forcast/domain/repository/weather_repository.dart';
import 'package:ai_tennis/features/forcast/domain/use_cases/get_forecast.dart';
import 'package:ai_tennis/features/forcast/domain/use_cases/get_weather.dart';
import 'package:ai_tennis/features/forcast/presentation/conroller/weather_bloc.dart';
import 'package:ai_tennis/features/home/domain/use_cases/get_location_use_case.dart';
import 'package:ai_tennis/features/home/presentation/controller/get_location/get_location_bloc.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc_observer.dart';
import 'core/utils/size_config.dart';
import 'firebase_options.dart';
import 'package:ai_tennis/core/services/services_locater.dart' as di;

final NavigationService navigationService = NavigationService(); // Global instance

void main()async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GetCurrentLocationUseCase getCurrentLocationUseCase;
    final WeatherRepository weatherRepository;

    return  MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(
            loginUseCase: LoginUseCase(sl()),
            registerUseCase: RegisterUseCase(sl()),

          ),
        ),
        BlocProvider(
          create: (context) => GetLocationBloc(
              getCurrentLocationUseCase: sl(),

          ),
        ),
        BlocProvider(create: (context)=>WeatherBloc(
            getWeather: sl(), getForecast:sl(), getPredictionUseCase: sl() ))
      ],
      child: LayoutBuilder(
        builder: (context ,constrains) {
          SizeConfig.init(context);
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              navigatorKey: navigationService.navigatorKey,
              initialRoute: Routes.getLocation,
              onGenerateRoute: Routes.generateRoute // Use the routes
          );
        }
      ),
        );
  }
}
