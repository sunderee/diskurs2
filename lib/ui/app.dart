import 'package:diskursv2/ui/screens/home.screen.dart';
import 'package:diskursv2/utils/constants/color.const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: colorBrand,
          centerTitle: true,
          elevation: 0.0,
        ),
        primaryColor: colorBrand,
      ),
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
      },
    );
  }
}
