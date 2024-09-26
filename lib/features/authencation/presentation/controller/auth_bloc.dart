import 'dart:async';
import 'package:ai_tennis/core/error/failure.dart';
import 'package:ai_tennis/features/authencation/domain/use_case/login_use_case.dart';
import 'package:ai_tennis/features/authencation/domain/use_case/register_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/auth.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;

  AuthBloc({required this.loginUseCase,required this.registerUseCase}) : super(AuthInitial()) {
    on<LoginEvent>(_onLoginEvent);
    on<RegisterEvent>(_onRegisterEvent);
  }

  FutureOr<void> _onLoginEvent(
      LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final user = Auth(
      email: event.email,
      password: event.password,
    );
    final result = await loginUseCase(user);

    result.fold(
      (l) => emit(AuthError(_failureMessage(l))),
      (r) => emit(AuthSuccess(r)),
    );
  }

  FutureOr<void> _onRegisterEvent(
      RegisterEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final user = Auth(email: event.email, password: event.password);
    final result = await registerUseCase(user);

    result.fold(
      (l) => emit(AuthError(_failureMessage(l))),
      (r) => emit(AuthSuccess(r)),
    );
  }

  String _failureMessage(Failure failure) {
    return failure.message;
  }
}
