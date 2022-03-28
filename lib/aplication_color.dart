import 'package:flutter/material.dart';

class AplicationColor with ChangeNotifier {
  bool _islighblue = true;

  bool get islighblue => _islighblue;

  set islighblue(bool value) {
    _islighblue = value;
    notifyListeners();
  }

  Color get color => (_islighblue) ? Colors.lightBlue : Colors.amber;
}
