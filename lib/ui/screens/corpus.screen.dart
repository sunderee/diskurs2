import 'package:diskursv2/api/repositories/language.enum.dart';
import 'package:diskursv2/blocs/corpus/corpus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CorpusScreen extends StatelessWidget {
  final LanguageEnum language;
  final String query;

  const CorpusScreen({
    Key? key,
    required this.language,
    required this.query,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<CorpusCubit>().requestCorpusResults(language, query);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Corpus lookup'),
      ),
      body: BlocListener<CorpusCubit, CorpusState>(
        listener: (BuildContext context, CorpusState state) {
          if (state.exception != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.exception.toString()),
              ),
            );
          }
        },
        child: BlocBuilder<CorpusCubit, CorpusState>(
          builder: (BuildContext context, CorpusState state) {
            if (state.exception == null) {
              if (state.data.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return SafeArea(
                  minimum: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ListView.builder(
                    itemCount: state.data.length,
                    itemBuilder: (BuildContext context, int index) => ListTile(
                      leading: const Icon(Icons.format_quote),
                      title: Text(
                        _removeHtmlTags(state.data[index]),
                        style: Typography.material2018().englishLike.bodyText1,
                      ),
                    ),
                  ),
                );
              }
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  String _removeHtmlTags(String htmlText) {
    RegExp exp = RegExp(r'<[^>]*>', multiLine: true, caseSensitive: true);
    return htmlText.replaceAll(exp, '');
  }
}
