import 'package:diskursv2/api/repositories/query.repository.dart';
import 'package:diskursv2/blocs/bloc.exception.dart';
import 'package:diskursv2/blocs/query/query.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QueryBloc extends Bloc<QueryEvent, QueryState> {
  final queryRepository = QueryRepository();

  QueryBloc() : super(const QueryState.initial());

  @override
  Stream<QueryState> mapEventToState(QueryEvent event) async* {
    if (event is RetrieveQueriesEvent) {
      yield const QueryState.loading();
      try {
        final data = await queryRepository.fetchQueries(
          event.language,
          event.query,
        );
        if (data.isNotEmpty) {
          yield QueryState.success(data.toList());
        } else {
          yield const QueryState.failure(BlocException('No data was found'));
        }
      } on BlocException catch (e) {
        yield QueryState.failure(e);
      } catch (e) {
        yield const QueryState.failure(
            BlocException('Fatal application error'));
      }
    } else {
      yield const QueryState.failure(BlocException('Fatal application error'));
    }
  }
}
