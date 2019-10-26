import 'package:flutter/material.dart';
import 'package:flutter_bloc/blocs/counter_bloc.dart';
import 'package:flutter_bloc/blocs/theme_bloc.dart';
import 'package:flutter_bloc/pages/counter_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<CounterBloc>.value(
            value: CounterBloc()
          ),
          ChangeNotifierProvider<ThemeChanger>.value(
            value: ThemeChanger(ThemeData.light())
          )
        ], 
        child: MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      home: CounterPage(),
      theme: theme.getTheme(),
    );
  }

}