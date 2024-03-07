import 'package:faker/faker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:investapp/modules/user/user.dart';
import 'package:investapp/shared/services/firebase/firebase_service.dart';
import 'package:mockito/mockito.dart';

void main() {
  final UserRemoteDataSource source = UserRemoteDataSource(FirebaseAuthMock());
  final String fakerEmail = Faker().internet.email();
  const String fakerPassword = "teste123";

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await initializeFirebase();
  });

  group("Deve autenticar e registrar um usuario", () {
    test("Deve registrar um novo usuário", () async {
      UserCredential? credential = await source.register(
          fakerEmail, fakerPassword);

      expect(credential, isNotNull);
    });

    test("Deve retornar um usuario autenticado", () async {
      UserCredential? credential = await source.login(
          fakerEmail, fakerPassword);

      expect(credential, isNotNull);
    });

    test("Deve retornar um erro caso usuario passe o email ou senha errados", () async {
      UserCredential? credential = await source.login(
          fakerEmail, fakerPassword);

      expect(credential, allOf([
        throwsA(FirebaseAuthException),
        throwsA(PlatformException),
      ]));
    });
  });
}

final class FirebaseAuthMock with Mock implements FirebaseAuth {}
