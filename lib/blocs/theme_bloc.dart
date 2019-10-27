
import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  ThemeData _themeData;
  bool _isLoading = false;
  ThemeChanger(this._themeData);

  getTheme() => _themeData;
  isLoading() => _isLoading;

  setTheme(ThemeData theme) {
  _isLoading = true;
  notifyListeners();
  Future.delayed(const Duration(milliseconds: 3000), () {
    _themeData = theme;
    _isLoading = false;
    notifyListeners();
  });
    
    
  }
}