import 'package:flutter/material.dart';

class CustomTheme {
  CustomTheme._();

  static final CustomTheme _ourInstance = new CustomTheme._();

  static CustomTheme getInstance() {
    return _ourInstance;
  }

  final ThemeData customTheme = ThemeData(
    splashColor: Colors.redAccent[100],
    primaryColor: Colors.red[700],
    accentColor: Colors.orange[900]
  );
}
