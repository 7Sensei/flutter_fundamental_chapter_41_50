import 'package:flutter/cupertino.dart';

class Money with ChangeNotifier {
  int _balance = 10000;
  int get balance => _balance;

  set balance(int balance) {
    _balance = balance;
    notifyListeners();
  }
}
