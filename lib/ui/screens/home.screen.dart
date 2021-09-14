import 'package:diskursv2/api/repositories/language.enum.dart';
import 'package:diskursv2/blocs/query/query.dart';
import 'package:diskursv2/ui/widgets/language_picker.widget.dart';
import 'package:diskursv2/ui/widgets/menu_picker.widget.dart';
import 'package:diskursv2/utils/constants/color.const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late bool _displayLoadingIndicator;

  @override
  void initState() {
    super.initState();
    _displayLoadingIndicator = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diskurs'),
        actions: [
          LanguagePickerWidget(
            onLanguagePicked: (LanguageEnum newLanguage) {},
          ),
          MenuPickerWidget(
            onMenuItemClickListener: (int menuID) {},
          ),
        ],
        bottom: _displayLoadingIndicator
            ? const PreferredSize(
                child: LinearProgressIndicator(
                  color: colorBrand,
                  backgroundColor: Colors.white,
                ),
                preferredSize: Size.fromHeight(2.0),
              )
            : null,
      ),
      body: BlocListener<QueryCubit, QueryState>(
        listener: (BuildContext context, QueryState state) {
          setState(() => _displayLoadingIndicator = state.isLoading);
          if (state.exception != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.exception.toString()),
              ),
            );
          }
        },
        child: SafeArea(
          minimum: const EdgeInsets.all(16.0),
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            children: [
              TextField(
                autofocus: true,
                decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: colorBrand),
                  ),
                  hintText: 'Input',
                ),
                onSubmitted: (String query) {
                  context.read<QueryCubit>().requestQueries(
                        LanguageEnum.slovene,
                        query,
                      );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: MaterialButton(
                  color: colorBrand,
                  child: Text(
                    'Corpus lookup'.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              _HomeScreenBody(
                renderIsLoading: (bool isLoading) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HomeScreenBody extends StatelessWidget {
  final Function(bool) renderIsLoading;

  const _HomeScreenBody({
    Key? key,
    required this.renderIsLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QueryCubit, QueryState>(
      builder: (BuildContext bodyContext, QueryState state) {
        if (state.data.isEmpty) {
          return const SizedBox();
        }
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.data.length,
          itemBuilder: (BuildContext listViewContext, int index) => ListTile(
            title: Text(state.data[index].term ?? ''),
            subtitle: Text(
              'Frequency: ${state.data[index].frequency}',
            ),
            trailing: Text(
              "${state.data[index].similarity ?? 0}%",
            ),
          ),
        );
      },
    );
  }
}
