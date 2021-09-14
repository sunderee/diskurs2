import 'package:diskursv2/api/repositories/language.enum.dart';
import 'package:diskursv2/api/repositories/query.repository.dart';
import 'package:diskursv2/blocs/query/query.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QueryCubit extends Cubit<QueryState> {
  final QueryRepository _repository;

  QueryCubit(this._repository) : super(const QueryState());

  Future<void> requestQueries(
    LanguageEnum language,
    String query,
  ) async {
    emit(
      state.copyWith(
        newIsLoading: true,
      ),
    );
    try {
      final data = await _repository.fetchQueries(language, query);
      emit(
        state.copyWith(
          newData: data.toList(),
          newIsLoading: false,
        ),
      );
    } on Exception catch (exception) {
      emit(
        state.copyWith(
          newException: exception,
          newIsLoading: false,
        ),
      );
    }
  }
}
