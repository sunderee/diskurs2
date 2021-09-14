import 'package:diskursv2/api/repositories/corpus.repository.dart';
import 'package:diskursv2/api/repositories/language.enum.dart';
import 'package:diskursv2/blocs/corpus/corpus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CorpusCubit extends Cubit<CorpusState> {
  final CorpusRepository _repository;

  CorpusCubit(this._repository) : super(const CorpusState());

  Future<void> requestCorpusResults(
    LanguageEnum language,
    String query,
  ) async {
    try {
      final data = await _repository.retrieveCorpusEntries(language, query);
      emit(state.copyWith(newData: data));
    } on Exception catch (exception) {
      emit(state.copyWith(newException: exception));
    }
  }
}
