part of "quote_bloc.dart";

abstract class QuoteEvent {}

final class QuoteLoadingEvent extends QuoteEvent {}

final class QuoteErrorEvent extends QuoteEvent {
  final String message;
  QuoteErrorEvent(this.message);
}