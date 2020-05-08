import 'package:b3_news_app/domain/ticker_history/ticker_history.dart';
import 'package:b3_news_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TickerSymbolBuilder {
  static Widget buildTickerSymbol(String ticker) {
    return InkWell(
      onTap: () => Get.to(TickerHistory(ticker, DateTime.now())),
      child: Container(
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
          style: const TextStyle(fontSize: 17, color: B3NewsColors.primaryBlue),
        ),
      ),
    );
  }
}
