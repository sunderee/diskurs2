import 'package:diskursv2/api/repositories/query.repository.dart';
import 'package:diskursv2/blocs/query/query.cubit.dart';
import 'package:diskursv2/ui/screens/home.screen.dart';
import 'package:diskursv2/utils/constants/color.const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  final QueryRepository _repository;

  const App({
    Key? key,
    required QueryRepository queryRepository,
  })  : _repository = queryRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: colorBrand,
          centerTitle: true,
          elevation: 0.0,
        ),
        primaryColor: colorBrand,
      ),
      home: RepositoryProvider.value(
        value: _repository,
        child: BlocProvider(
          create: (BuildContext context) => QueryCubit(_repository),
          child: const HomeScreen(),
        ),
      ),
    );
  }
}
