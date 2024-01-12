
import 'package:investapp/shared/base/base.dart';

final class GlobalContext {
  static final GlobalContext _instance = GlobalContext._();

  GlobalContext._();

  factory GlobalContext() => _instance;

  BuildContext? context;
}