import 'package:b3_news_app/utils/colors.dart';
import 'package:flutter/material.dart';

ThemeData basicTheme() {
  TextTheme _basicTextTheme(TextTheme base) {
    return base.copyWith(
      headline: base.headline.copyWith(
        color: Colors.white,
        fontStyle: FontStyle.italic,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      title: base.headline.copyWith(
        color: Colors.white,
        fontSize: 17,
        fontWeight: FontWeight.w600,
      ),
      display1: base.display1.copyWith(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      display2: base.display2.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
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
    primaryColor: B3NewsColors.primaryBlue,
    accentColor: B3NewsColors.lightYellow,
    scaffoldBackgroundColor: B3NewsColors.primaryBlue,
  );
}
