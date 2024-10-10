import 'package:ai_tennis/features/forcast/presentation/screen/weather_screen.dart';
import 'package:ai_tennis/features/home/presentation/screens/location_screen.dart';
import 'package:ai_tennis/features/on_boarding/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:ai_tennis/features/authencation/presentation/screens/auth.dart';
import 'package:ai_tennis/features/authencation/presentation/screens/login.dart';
import 'package:ai_tennis/features/authencation/presentation/screens/register.dart';
import 'package:ai_tennis/features/on_boarding/presentation/screens/on_boarding.dart';

class Routes {
  static const String splash = '/splash';
  static const String auth = '/auth';
  static const String login = '/login';
  static const String register = '/register';
  static const String onBoarding = '/onBoarding';
  static const String getLocation = '/getLocation';
  static const String forecast = '/forecast';


  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return _buildRoute(const SplashScreen());
      case auth:
        return _buildRoute(const Auth());
      case login:
        return _buildRoute(const LoginScreen());
      case register:
        return _buildRoute(const RegisterScreen());
      case onBoarding:
        return _buildRoute(const OnBoarding());
      case getLocation:
        return _buildRoute( const GetLocationScreen());
      case forecast:
        return _buildRoute(  WeatherScreen());
      default:
        return _buildRoute(const Auth()); // Default route
    }
  }

  static MaterialPageRoute _buildRoute(Widget page) {
    return MaterialPageRoute(
      builder: (_) => page,
    );
  }
}
