import 'package:bloc/bloc.dart';
import 'package:investapp/modules/quote/domain/entities/quote.dart';
import 'package:investapp/modules/quote/domain/services/quote_service.dart';
import 'package:investapp/shared/shared.dart';

part 'quote_event.dart';
part 'quote_state.dart';

final class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
  final QuoteService _quoteService;

  QuoteBloc(this._quoteService) : super(QuoteInitialState()) {
    on<QuoteLoadingEvent>(_onLoading);
    on<QuoteErrorEvent>(_onError);
    add(QuoteLoadingEvent());
  }

  Future<void> _onLoading(QuoteLoadingEvent event, Emitter<QuoteState> emit) async {
    emit(QuoteLoadingState(null));
    try {
      final Quote response = await _quoteService.getAPI();
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
