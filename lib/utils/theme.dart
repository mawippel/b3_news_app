import 'package:flutter/material.dart';

ThemeData basicTheme() {
  TextTheme _basicTextTheme(TextTheme base) {
    return base.copyWith(
      headline: base.headline.copyWith(
          color: Colors.white,
          fontStyle: FontStyle.italic,
          fontSize: 20,
          fontWeight: FontWeight.w600),
      title: base.headline.copyWith(
          color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600),
      display1: base.display1.copyWith(
          color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
      display2: base.display2.copyWith(
          fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
      display3: base.display3.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  final base = ThemeData.dark();
  return base.copyWith(
    textTheme: _basicTextTheme(base.textTheme),
    primaryColor: Colors.white,
    accentColor: const Color.fromRGBO(253, 234, 160, 1),
    scaffoldBackgroundColor: const Color.fromRGBO(15, 34, 45, 1),
  );
}
