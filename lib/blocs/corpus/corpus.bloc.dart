import 'package:diskursv2/api/repositories/corpus.repository.dart';
import 'package:diskursv2/blocs/bloc.exception.dart';
import 'package:diskursv2/blocs/corpus/corpus.event.dart';
import 'package:diskursv2/blocs/corpus/corpus.state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CorpusBloc extends Bloc<CorpusEvent, CorpusState> {
  final queryRepository = CorpusRepository();

  CorpusBloc() : super(const CorpusState.initial());

  @override
  Stream<CorpusState> mapEventToState(CorpusEvent event) async* {
    if (event is RetrieveCorpusEvent) {
      yield const CorpusState.loading();
      try {
        final data = await queryRepository.retrieveCorpusEntries(
          event.language,
          event.query,
        );
        if (data.isNotEmpty) {
          yield CorpusState.success(data.toList());
        } else {
          yield const CorpusState.failure(BlocException('No data was found'));
        }
      } on BlocException catch (e) {
        yield CorpusState.failure(e);
      } catch (e) {
        yield const CorpusState.failure(
            BlocException('Fatal application error'));
      }
    } else {
      yield const CorpusState.failure(BlocException('Fatal application error'));
    }
  }
}
