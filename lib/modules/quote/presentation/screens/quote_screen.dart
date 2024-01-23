import 'package:investapp/modules/quote/presentation/controllers/quote_controller.dart';
import 'package:investapp/modules/quote/presentation/widgets/quote_list_widget.dart';
import 'package:investapp/shared/shared.dart';

final class QuoteScreen extends BaseScreen<QuoteController> {
  const QuoteScreen({super.key});

  @override
  Widget builder(BuildContext context) {
    return QuoteListWidget();
  }
}