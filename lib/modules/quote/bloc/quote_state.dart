part of "quote_bloc.dart";

abstract class QuoteState {
  final Quote? quote;
  QuoteState(this.quote);
}

final class QuoteInitialState extends QuoteState {
  QuoteInitialState() : super(null);
}

final class QuoteLoadingState extends QuoteState {
  QuoteLoadingState(super.quote);
}

final class QuoteSuccessState extends QuoteState {
  QuoteSuccessState(super.quote);
}

final class QuoteErrorState extends QuoteState {
  final String message;
  QuoteErrorState(super.quote, this.message);
}
