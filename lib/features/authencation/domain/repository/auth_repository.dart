

import 'package:ai_tennis/core/error/failure.dart';
import 'package:ai_tennis/features/authencation/domain/entities/auth.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {

  Future<Either<Failure, User>> login(Auth user);

  Future<Either<Failure, User>> signup(Auth user);

}
