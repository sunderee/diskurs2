import 'package:diskursv2/api/repositories/language.enum.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@sealed
abstract class QueryEvent extends Equatable {
  const QueryEvent._();

  @protected
  const factory QueryEvent.retrieve(LanguageEnum language, String query) =
      RetrieveQueriesEvent;
}

class RetrieveQueriesEvent extends QueryEvent {
  final LanguageEnum language;
  final String query;

  const RetrieveQueriesEvent(this.language, this.query) : super._();

  @override
  List<Object?> get props => [language, query];
}
