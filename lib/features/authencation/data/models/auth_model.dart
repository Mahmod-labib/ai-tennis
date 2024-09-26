import 'package:firebase_auth/firebase_auth.dart';

class AuthModel {
  final String email;
  final String uid;

  AuthModel({required this.email, required this.uid});

  factory AuthModel.fromFirebaseUser(User user) {
    return AuthModel(
      email: user.email ?? '',
      uid: user.uid,
    );
  }
}
