import 'package:flutter/material.dart';

class CounterBloc extends ChangeNotifier {
  int _counter = 10;
  bool _isLoading = false;
  int get counter => _counter;
  bool get isLoading => _isLoading;

  set counter(int val){
    _isLoading = true;
    notifyListeners();
    
    Future.delayed(const Duration(milliseconds: 3000), () {
      _counter = val;
      _isLoading = false;
      notifyListeners();
  });

    
  }

  increment(){
    counter++;
  }

  decrement(){
    counter--;
  }
}