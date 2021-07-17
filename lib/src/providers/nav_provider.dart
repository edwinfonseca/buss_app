import 'package:flutter/material.dart';

class NavProvider extends ChangeNotifier {
  int _seleccionMenu = 0;

  int get seleccionMenu {
    return this._seleccionMenu;
  }

  set seleccionMenu(int i) {
    this._seleccionMenu = i;
    notifyListeners();
  }
}
