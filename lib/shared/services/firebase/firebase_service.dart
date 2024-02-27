import 'package:firebase_core/firebase_core.dart';
import 'package:investapp/firebase_options.dart';

Future<FirebaseApp> initializeFirebase() async {
  return await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
