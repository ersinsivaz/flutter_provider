import 'package:flutter/material.dart';
import 'package:flutter_bloc/blocs/counter_bloc.dart';
import 'package:flutter_bloc/widgets/decrement.dart';
import 'package:flutter_bloc/widgets/increment.dart';
import 'package:flutter_bloc/widgets/loading_container.dart';
import 'package:flutter_bloc/widgets/theme_dark.dart';
import 'package:flutter_bloc/widgets/theme_light.dart';
import 'package:provider/provider.dart';

class CounterPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = Provider.of<CounterBloc>(context);
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                counterBloc.counter.toString(),
                style: TextStyle(fontSize: 62.0),
              ),
              IncrementButton(),
              DecrementButton(),
              LightThemeButton(),
              DarkThemeButton(),
              LoadingContainer(isVisible: counterBloc.isLoading,),
            ],
          ),
        ),
      ),
    );
  }

}