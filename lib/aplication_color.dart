import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class AplicationColor with ChangeNotifier {
  bool _islighblue = true;

  bool get islighblue => _islighblue;

  set islighblue(bool value) {
    _islighblue = value;
    notifyListeners();
  }

  Color get color => (_islighblue) ? Colors.lightBlue : Colors.amber;
}
