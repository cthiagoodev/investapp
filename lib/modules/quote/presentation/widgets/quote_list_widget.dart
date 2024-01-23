import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:investapp/modules/quote/bloc/quote_bloc.dart';
import 'package:investapp/modules/quote/data/datasources/remote/quote_remote_datasource.dart';
import 'package:investapp/modules/quote/data/repositories/quote_repository.dart';
import 'package:investapp/modules/quote/domain/entities/quote.dart';
import 'package:investapp/modules/quote/domain/entities/stock.dart';
import 'package:investapp/modules/quote/domain/usecases/get_quote_usecase.dart';
import 'package:investapp/modules/quote/presentation/controllers/quote_controller.dart';
import 'package:investapp/shared/shared.dart';

final class QuoteListWidget extends BaseWidget<QuoteController> {
  const QuoteListWidget({super.key});

  @override
  Widget builder(BuildContext context) {
    return BlocProvider(
      create: onCreate,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: Text(
              "Cotações disponíveis",
              style: theme.textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),

          Expanded(
            child: BlocBuilder<QuoteBloc, QuoteState>(
              builder: (context, state) {
                return switch(state.runtimeType) {
                  QuoteSuccessState => state.quote == null
                      ? _buildEmpty()
                      : _buildState(state.quote!),
                  QuoteLoadingState => _buildLoading(),
                  QuoteErrorState => _buildError((state as QuoteErrorState).message),
                  _ => _buildEmpty(),
                };
              },
            ),
          ),
        ],
      ),
    );
  }

  QuoteBloc onCreate(BuildContext context) {
    return QuoteBloc(
        GetQuoteUseCase(RemoteQuoteRepository(QuoteRemoteDataSource(GetIt.I.get<HttpClient>()))));
  }

  Widget _buildState(Quote state) {
    return ListView.builder(
      itemCount: state.stocks.length,
      itemBuilder: (context, index) {
        final Stock stock = state.stocks[index];
        return Padding(
          padding: EdgeInsets.only(bottom: 10.h),
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
                          child: CircularProgressIndicator(
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
        );
      },
    );
  }

  Widget _buildLoading() {
    return Center(
      child: SizedBox(
        width: 50.w,
        height: 50.w,
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildError(String message) {
    return Center(
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: theme.textTheme.bodySmall,
      ),
    );
  }

  Widget _buildEmpty() {
    return SizedBox(
      width: 50.w,
      height: 50.w,
      child: CircularProgressIndicator(),
    );
  }
}