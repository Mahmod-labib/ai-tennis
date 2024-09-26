import 'package:ai_tennis/features/authencation/data/data_source/firebase_remote_data_source.dart';
import 'package:ai_tennis/features/authencation/data/repository/firebase_auth_repository.dart';
import 'package:ai_tennis/features/authencation/domain/use_case/login_use_case.dart';
import 'package:ai_tennis/features/authencation/domain/use_case/register_use_case.dart';
import 'package:ai_tennis/features/authencation/presentation/controller/auth_bloc.dart';
import 'package:ai_tennis/features/on_boarding/presentation/screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseRemoteDataSource = FirebaseRemoteDataSource(
      firebaseAuth: FirebaseAuth.instance,
    );

    final authRepository = FirebaseAuthRepository(
      firebaseRemoteDataSource
    );
    return  MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(
            loginUseCase: LoginUseCase(authRepository),
            registerUseCase: RegisterUseCase(authRepository),
          ),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
