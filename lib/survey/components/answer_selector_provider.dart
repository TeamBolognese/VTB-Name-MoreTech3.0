import 'package:flutter/material.dart';

class AnswerSelectorProvider with ChangeNotifier {
  int? selectedNumber;

  void change(int number) {
    selectedNumber = number;
    notifyListeners();
  }
}
