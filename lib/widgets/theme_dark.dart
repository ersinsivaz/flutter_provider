
import 'package:flutter/material.dart';
import 'package:flutter_bloc/blocs/theme_bloc.dart';
import 'package:provider/provider.dart';

class DarkThemeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeChanger themeChanger = Provider.of<ThemeChanger>(context);
    return FlatButton.icon(
      icon: Icon(Icons.account_circle),
      label: Text("Dark"),
      onPressed: () => themeChanger.setTheme(ThemeData.dark()),
    );
  }

}