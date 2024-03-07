import 'package:firebase_auth/firebase_auth.dart';

final class UserRemoteDataSource {
  final FirebaseAuth _firebaseAuth;

  const UserRemoteDataSource(this._firebaseAuth);

  Future<UserCredential?> login(String email, String password) async {
    final UserCredential credential = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    return credential;
  }

  Future<UserCredential> register(String email, String password) async {
    final UserCredential credential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    return credential;
  }
}