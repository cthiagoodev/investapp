import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:investapp/modules/quote/bloc/quote_bloc.dart';
import 'package:investapp/modules/quote/data/datasources/remote/quote_remote_datasource.dart';
import 'package:investapp/modules/quote/data/repositories/quote_repository.dart';
import 'package:investapp/modules/quote/domain/usecases/get_quote_usecase.dart';
import 'package:investapp/modules/quote/presentation/controllers/quote_controller.dart';
import 'package:investapp/shared/shared.dart';

final class QuoteListWidget extends BaseWidget<QuoteController> {
  const QuoteListWidget({super.key});

  @override
  Widget builder() {
    return BlocProvider(
      create: onCreate,
      child: BlocBuilder<QuoteBloc, QuoteState>(
        builder: (context, state) {

        },
      ),
    );
  }

  QuoteBloc onCreate(BuildContext context) {
    return QuoteBloc(
        GetQuoteUseCase(RemoteQuoteRepository(QuoteRemoteDataSource(GetIt.I.get<HttpClient>()))));
  }
}