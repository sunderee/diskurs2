import 'package:diskursv2/api/repositories/corpus.repository.dart';
import 'package:diskursv2/api/repositories/query.repository.dart';
import 'package:diskursv2/ui/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/corpus/corpus.cubit.dart';
import 'blocs/query/query.cubit.dart';

void main() {
  final queryRepository = QueryRepository();
  final corpusRepository = CorpusRepository();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => QueryCubit(queryRepository),
          lazy: false,
        ),
        BlocProvider(
          create: (BuildContext context) => CorpusCubit(corpusRepository),
          lazy: true,
        ),
      ],
      child: const App(),
    ),
  );
}
