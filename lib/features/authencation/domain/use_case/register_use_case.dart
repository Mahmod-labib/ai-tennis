import 'package:ai_tennis/core/error/failure.dart';
import 'package:ai_tennis/core/use_case/base_use_case.dart';
import 'package:ai_tennis/features/authencation/domain/entities/auth.dart';
import 'package:ai_tennis/features/authencation/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterUseCase implements BaseUseCase<User, Auth> {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  @override
  Future<Either<Failure, User>> call(Auth parameters) async {
    return await repository.signup(parameters);
  }
}
