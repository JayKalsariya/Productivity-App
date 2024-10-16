import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _isCupertino = false;

  bool get isCupertino => _isCupertino;

  void toggleTheme() {
    _isCupertino = !_isCupertino;
    notifyListeners();
  }
}
