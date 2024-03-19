import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:investapp/modules/quote/bloc/quote/quote_bloc.dart';
import 'package:investapp/modules/quote/domain/entities/quote.dart';
import 'package:investapp/modules/quote/presentation/viewmodels/quote_viewmodel.dart';
import 'package:investapp/modules/quote/presentation/widgets/quote_list_widget.dart';
import 'package:investapp/modules/quote/presentation/widgets/quote_loading_widget.dart';
import 'package:investapp/shared/shared.dart';

final class QuoteView extends BaseView<QuoteViewModel> {
  const QuoteView({super.key});

  @override
  Widget builder(BuildContext context) {
    return BlocProvider(
      create: (_) => viewModel.quoteBloc,
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