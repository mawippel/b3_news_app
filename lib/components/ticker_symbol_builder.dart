import 'package:b3_news_app/utils/colors.dart';
import 'package:flutter/material.dart';

class TickerSymbolBuilder {
  static Widget buildTickerSymbol(String ticker) {
    return Container(
      margin: const EdgeInsets.only(right: 5, left: 5, bottom: 5),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.grey,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Text(
        ticker,
        style: TextStyle(fontSize: 17, color: B3NewsColors.primaryBlue),
      ),
    );
  }
}
