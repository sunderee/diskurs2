import 'package:diskursv2/api/repositories/language.enum.dart';
import 'package:diskursv2/api/repositories/query.repository.dart';
import 'package:diskursv2/blocs/query/query.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QueryCubit extends Cubit<QueryState> {
  final QueryRepository repository;

  QueryCubit(this.repository) : super(const QueryState());

  Future<void> requestQueries(
    LanguageEnum language,
    String query,
  ) async {
    try {
      final data = await repository.fetchQueries(language, query);
      emit(state.copyWith(newData: data.toList()));
    } on Exception catch (exception) {
      print(exception);
      emit(state.copyWith(newException: exception));
    }
  }
}
