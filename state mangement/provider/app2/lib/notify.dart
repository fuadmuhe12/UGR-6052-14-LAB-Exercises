import 'package:flutter/material.dart';
class UserProvider extends ChangeNotifier{
  int _counter = 0;
  int get counter => _counter;
  void increment(){
    _counter++;
    notifyListeners();
  }
}