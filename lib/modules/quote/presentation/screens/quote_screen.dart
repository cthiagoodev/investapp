import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:investapp/modules/quote/bloc/quote_bloc.dart';
import 'package:investapp/modules/quote/data/datasources/remote/quote_remote_datasource.dart';
import 'package:investapp/modules/quote/data/repositories/quote_repository.dart';
import 'package:investapp/modules/quote/domain/entities/quote.dart';
import 'package:investapp/modules/quote/domain/usecases/get_quote_usecase.dart';
import 'package:investapp/modules/quote/presentation/controllers/quote_controller.dart';
import 'package:investapp/modules/quote/presentation/widgets/quote_list_widget.dart';
import 'package:investapp/modules/quote/presentation/widgets/quote_loading_widget.dart';
import 'package:investapp/shared/shared.dart';

final class QuoteScreen extends BaseScreen<QuoteController> {
  const QuoteScreen({super.key});

  @override
  Widget builder(BuildContext context) {
    return BlocProvider(
      create: onCreate,
      child: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
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
    );
  }

  QuoteBloc onCreate(BuildContext context) {
    return QuoteBloc(
        GetQuoteUseCase(RemoteQuoteRepository(QuoteRemoteDataSource(GetIt.I.get<HttpClient>()))));
  }

  Widget _buildState(Quote state) {
    return QuoteListWidget(state);
  }

  Widget _buildLoading() {
    return const QuoteLoadingWidget();
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
      child: const CircularProgressIndicator(),
    );
  }
}