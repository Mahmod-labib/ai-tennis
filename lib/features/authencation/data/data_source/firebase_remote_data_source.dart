import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseFirebaseRemoteDataSource {
  Future<User> login(String email, String password);
  Future<User> register(String email, String password);
}

class FirebaseRemoteDataSource extends BaseFirebaseRemoteDataSource {
  final FirebaseAuth firebaseAuth;

  FirebaseRemoteDataSource({required this.firebaseAuth});

  @override
  Future<User> login(String email, String password) async {
    final result = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return result.user!;
  }

  @override
  Future<User> register(String email, String password) async {
    final result = await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return result.user!;
  }
}
