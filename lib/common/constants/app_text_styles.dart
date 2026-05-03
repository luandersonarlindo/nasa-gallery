import 'package:flutter/material.dart';

class AppTextStyles {
  AppTextStyles._();

  static final String _defaultFontFamily = 'Nasalization';

  static TextStyle titleAppBar = TextStyle(
    fontSize: 48,
    fontFamily: _defaultFontFamily,
    fontWeight: .bold,
  );

  static TextStyle smallText = TextStyle(
    fontSize: 14,
    fontFamily: _defaultFontFamily,
    fontWeight: .w200
  );

  static TextStyle mediumText = TextStyle(
    fontSize: 18,
    fontFamily: _defaultFontFamily,
    fontWeight: .normal,
  );

  static TextStyle largeText = TextStyle(
    fontSize: 30,
    fontFamily: _defaultFontFamily,
    fontWeight: .normal,
  );

  static TextStyle defaultButtons = TextStyle(
    fontSize: 20,
    fontFamily: _defaultFontFamily,
    fontWeight: .bold,
  );

  static TextStyle inputText = TextStyle(
    fontSize: 14,
    fontFamily: _defaultFontFamily,
    fontWeight: .w500
  );

  static TextStyle inputHintText = TextStyle(
    fontSize: 12, 
    fontFamily: _defaultFontFamily,
    fontWeight: .w400
  );

}