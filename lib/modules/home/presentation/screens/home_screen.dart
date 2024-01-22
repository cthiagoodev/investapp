import 'package:investapp/modules/home/presentation/controllers/home_controller.dart';
import 'package:investapp/modules/quote/quote.dart';
import 'package:investapp/shared/shared.dart';

final class HomeScreen extends BaseScreen<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget builder() {
    return QuoteListWidget();
  }
}
