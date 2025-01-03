import 'package:flutter/material.dart';

class CounterModel with ChangeNotifier {
  String _name = '';
  String get name => _name;

  void changeName(String newName) {
    _name = newName;
    notifyListeners();
  }
}
