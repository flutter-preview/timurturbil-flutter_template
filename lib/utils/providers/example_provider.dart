import 'package:flutter/material.dart';

class ExampleProvider extends ChangeNotifier {
  String? _example;

  String? get example => _example;

  void setExample(String value) {
    _example = value;
    notifyListeners();
  }
}
