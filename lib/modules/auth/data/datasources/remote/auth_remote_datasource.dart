import 'package:firebase_auth/firebase_auth.dart';

final class AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth;

  const AuthRemoteDataSource(this._firebaseAuth);

  Future<UserCredential?> login(String email, String password) async {
    final UserCredential credential = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    return credential;
  }

  Future register(String email, String password) async {
    final UserCredential credential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    return credential;
  }
}