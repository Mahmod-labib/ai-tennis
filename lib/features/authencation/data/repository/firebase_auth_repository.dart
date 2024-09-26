import 'package:ai_tennis/core/error/failure.dart';
import 'package:ai_tennis/features/authencation/data/data_source/firebase_remote_data_source.dart';
import 'package:ai_tennis/features/authencation/domain/entities/auth.dart';
import 'package:ai_tennis/features/authencation/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthRepository extends AuthRepository{

 final FirebaseRemoteDataSource firebaseRemoteDataSource;

  FirebaseAuthRepository(this.firebaseRemoteDataSource);

  @override
  Future<Either<Failure, User>> login(Auth authEntity) async {
    try {
      final user = await firebaseRemoteDataSource.login(
        authEntity.email,
        authEntity.password,
      );
      return Right(user);
    } catch (e) {
      if (e is FirebaseAuthException) {
        return Left(AuthenticationFailure('Login failed: ${e.message}'));
      } else {
        return Left(UnknownFailure('Unknown error occurred'));
      }
    }
  }
 @override
 Future<Either<Failure, User>> signup(Auth authEntity) async {
   try {
     final user = await firebaseRemoteDataSource.register(
       authEntity.email,
       authEntity.password,
     );
     return Right(user);
   } catch (e) {
     if (e is FirebaseAuthException) {
       return Left(AuthenticationFailure('Signup failed: ${e.message}'));
     } else {
       return Left(UnknownFailure(' Unknown error occurred'));
     }
   }
 }
}