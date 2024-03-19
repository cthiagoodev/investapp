import 'package:investapp/injection.dart';
import 'package:investapp/modules/quote/bloc/quote/quote_bloc.dart';
import 'package:investapp/modules/quote/data/datasources/remote/quote_remote_datasource.dart';
import 'package:investapp/modules/quote/data/repositories/quote_repository.dart';
import 'package:investapp/modules/quote/domain/services/quote_service.dart';
import 'package:investapp/modules/quote/presentation/viewmodels/quote_viewmodel.dart';
import 'package:investapp/shared/basics/extensions.dart';
import 'package:investapp/shared/shared.dart';

class QuoteBinding implements Binding {
  @override
  void dependencies() {
    getIt.registerIfNotRegistered(
        QuoteViewModel(QuoteBloc(QuoteService(
            RemoteQuoteRepository(QuoteRemoteDataSource(getIt.get<HttpClient>()))))));
  }

  @override
  void dispose() {
    getIt.unregister<QuoteViewModel>();
  }
}