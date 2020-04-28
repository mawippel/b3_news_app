import 'package:b3_news_app/shared/models/sentiment.dart';
import 'package:flutter/material.dart';

class SentimentLabelBuilder {

  static Widget buildSentimentLabel(Sentiment sentiment) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: _getColorBySentiment(sentiment),
        border: Border.all(
          color: _getColorBySentiment(sentiment),
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Text(
        _getTextBySentiment(sentiment),
        style: const TextStyle(fontSize: 17),
      ),
    );
  }

  static Color _getColorBySentiment(Sentiment sentiment) {
    switch (sentiment) {
      case Sentiment.POSITIVE:
        return Colors.green;
      case Sentiment.NEGATIVE:
        return Colors.red;
      case Sentiment.NEUTRAL:
        return Colors.grey;
      case Sentiment.MIXED:
        return Colors.yellow;
      default:
        return Colors.grey;
    }
  }

  static String _getTextBySentiment(Sentiment sentiment) {
    switch (sentiment) {
      case Sentiment.POSITIVE:
        return 'POSITIVO';
      case Sentiment.NEGATIVE:
        return 'NEGATIVO';
      case Sentiment.NEUTRAL:
        return 'NEUTRO';
      case Sentiment.MIXED:
        return 'MISTURADA';
      default:
        return '';
    }
  }
}
