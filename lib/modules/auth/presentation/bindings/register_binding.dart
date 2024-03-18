import 'package:firebase_auth/firebase_auth.dart';
import 'package:investapp/injection.dart';
import 'package:investapp/modules/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:investapp/modules/auth/data/repositories/remote/auth_remote_repository.dart';
import 'package:investapp/modules/auth/domain/services/auth_service.dart';
import 'package:investapp/modules/auth/presentation/view_model/register_view_model.dart';
import 'package:investapp/shared/basics/extensions.dart';
import 'package:investapp/shared/shared.dart';

class RegisterBinding implements Binding {
  @override
  void dependencies() {
    getIt.registerIfNotRegistered<RegisterViewModel>(RegisterViewModel(
        AuthService(AuthRemoteRepository(AuthRemoteDataSource(FirebaseAuth.instance)))));
  }

  @override
  void dispose() {
    getIt.unregister<RegisterViewModel>();
  }
}