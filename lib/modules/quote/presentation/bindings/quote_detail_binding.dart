import 'package:investapp/injection.dart';
import 'package:investapp/modules/quote/presentation/viewmodels/quote_detail_viewmodel.dart';
import 'package:investapp/shared/basics/extensions.dart';
import 'package:investapp/shared/shared.dart';

class QuoteDetailBinding implements Binding {
  @override
  void dependencies() {
    getIt.registerIfNotRegistered<QuoteDetailViewModel>(QuoteDetailViewModel());
  }

  @override
  void dispose() {
   getIt.unregister<QuoteDetailViewModel>();
  }
}