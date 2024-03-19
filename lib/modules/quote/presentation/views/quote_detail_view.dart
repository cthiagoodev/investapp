import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:investapp/modules/quote/presentation/viewmodels/quote_detail_viewmodel.dart';
import 'package:investapp/shared/shared.dart';

final class QuoteDetailView extends BaseScreen<QuoteDetailViewModel> {
  const QuoteDetailView({super.key});

  @override
  Widget builder(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
    );
  }
}
