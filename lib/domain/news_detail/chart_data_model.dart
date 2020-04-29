import 'package:charts_flutter/flutter.dart';

class ChartDataModel {
  ChartDataModel(this.color, this.value, this.totalLength);

  final Color color;
  final int value;
  final int totalLength;

  double getPercentageValue() {
    return value / totalLength * 100;
  }
}
