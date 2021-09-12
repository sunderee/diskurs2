import 'package:diskursv2/api/repositories/language.enum.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@sealed
abstract class CorpusEvent extends Equatable {
  const CorpusEvent._();

  @protected
  const factory CorpusEvent.retrieve(LanguageEnum language, String query) =
      RetrieveCorpusEvent;
}

class RetrieveCorpusEvent extends CorpusEvent {
  final LanguageEnum language;
  final String query;

  const RetrieveCorpusEvent(this.language, this.query) : super._();

  @override
  List<Object?> get props => [language, query];
}
