import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:investapp/modules/quote/presentation/controllers/quote_detail_controller.dart';
import 'package:investapp/shared/shared.dart';

final class QuoteDetailScreen extends BaseScreen<QuoteDetailController> {
  const QuoteDetailScreen({super.key});

  @override
  initState() {

  }

  @override
  dispose() {
    GetIt.I.unregister<QuoteDetailController>();
  }

  @override
  Widget builder(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
    );
  }
}
