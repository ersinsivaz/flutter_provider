
import 'package:flutter/material.dart';
import 'package:flutter_bloc/blocs/counter_bloc.dart';
import 'package:provider/provider.dart';

class DecrementButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = Provider.of<CounterBloc>(context);
    return FlatButton.icon(
      icon: Icon(Icons.remove),
      label: Text("Decrement"),
      onPressed: () => counterBloc.decrement(),
    );
  }

}