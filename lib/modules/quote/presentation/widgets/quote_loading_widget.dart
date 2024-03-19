import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:investapp/modules/quote/presentation/viewmodels/quote_viewmodel.dart';
import 'package:investapp/shared/shared.dart';

final class QuoteLoadingWidget extends BaseWidget<QuoteViewModel> {
  const QuoteLoadingWidget({super.key});

  @override
  Widget builder(BuildContext context) {
    return ListView(
      children: List.generate(10, (index) => Padding(
        padding: EdgeInsets.only(bottom: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ShimmerEffectWidget(
                  child: Container(
                    width: 40.w,
                    height: 40.w,
                    margin: EdgeInsets.only(right: 10.w),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerEffectWidget(
                      child: Container(
                        width: 20.w,
                        height: 10.h,
                        color: Colors.white,
                      ),
                    ),

                    ShimmerEffectWidget(
                      child: Container(
                        width: 40.w,
                        height: 10.h,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ShimmerEffectWidget(
                  child: Container(
                    width: 15.w,
                    height: 10.h,
                    color: Colors.white,
                  ),
                ),

                ShimmerEffectWidget(
                  child: Container(
                    width: 15.w,
                    height: 10.h,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}