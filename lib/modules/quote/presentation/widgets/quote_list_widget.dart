import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:investapp/modules/quote/domain/entities/quote.dart';
import 'package:investapp/modules/quote/domain/entities/stock.dart';
import 'package:investapp/modules/quote/presentation/controllers/quote_controller.dart';
import 'package:investapp/shared/shared.dart';

final class QuoteListWidget extends BaseWidget<QuoteController> {
  final Quote _quote;

  const QuoteListWidget(this._quote, {super.key});

  @override
  Widget builder(BuildContext context) {
    return ListView.builder(
      itemCount: _quote.stocks.length,
      itemBuilder: (context, index) {
        final Stock stock = _quote.stocks[index];
        return Padding(
          padding: EdgeInsets.only(bottom: 10.h),
          child: InkWell(
            onTap: () => Navigator.of(context).pushNamed<Stock>(
              AppRoutes.quoteDetail,
              arguments: stock,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40.w,
                      height: 40.w,
                      margin: EdgeInsets.only(right: 10.w),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        shape: BoxShape.circle,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.r),
                        child: SvgPicture.network(
                          stock.logo ?? "",
                          placeholderBuilder: (context) => Padding(
                            padding: EdgeInsets.all(10.w),
                            child: const CircularProgressIndicator(
                              strokeWidth: .5,
                            ),
                          ),
                        ),
                      ),
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          stock.stock,
                          style: theme.textTheme.labelSmall,
                        ),

                        Text(
                          stock.sector ?? "",
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if(stock.close != null)
                      Text(
                        UtilBrasilFields.obterReal(stock.close!),
                        style: theme.textTheme.labelSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                    if(stock.change != null)
                      Text(
                        UtilBrasilFields.obterReal(stock.change!),
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: stock.change!.isNegative ? Colors.red : Colors.green,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}