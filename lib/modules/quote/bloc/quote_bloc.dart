import 'package:bloc/bloc.dart';
import 'package:investapp/modules/quote/domain/entities/quote.dart';
import 'package:investapp/modules/quote/domain/usecases/get_quote_usecase.dart';
import 'package:investapp/shared/shared.dart';

part 'quote_event.dart';
part 'quote_state.dart';

final class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
  final GetQuoteUseCase _getQuoteUseCase;

  QuoteBloc(this._getQuoteUseCase) : super(QuoteInitialState()) {
    on<QuoteLoadingEvent>(_onLoading);
    on<QuoteErrorEvent>(_onError);
  }

  Future<void> _onLoading(QuoteLoadingEvent event, Emitter<QuoteState> emit) async {
    emit(QuoteLoadingState(null));
    try {
      final List<Quote> response = await _getQuoteUseCase.getAPI();
      emit(QuoteSuccessState(response));
    } on AppException catch(error, exception) {
      emit(QuoteErrorState(null, error.toString()));
    } catch(error) {
      emit(QuoteErrorState(null, error.toString()));
    }
  }

  Future<void> _onError(QuoteErrorEvent event, Emitter<QuoteState> emit) async {
    addError(event.message);
    emit(QuoteErrorState(null, event.message));
  }
}
