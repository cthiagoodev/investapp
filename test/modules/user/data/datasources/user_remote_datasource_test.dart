import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:investapp/modules/user/user.dart';
import 'package:investapp/shared/services/firebase/firebase_service.dart';
import 'package:mockito/mockito.dart';

void main() {
  final UserRemoteDataSource source = UserRemoteDataSource(FirebaseAuthMock());

  setUpAll(() async {
    await initializeFirebase();
  });

  group("Deve autenticar e registrar um usuario", () {
    test("Deve retornar um usuario autenticado", () {

      when(source.login("thiagosousadev@gmail.com", "teste"))
        .thenAnswer((realInvocation) async => UserCredential._());
    });
  });
}

final class FirebaseAuthMock with Mock implements FirebaseAuth {}
