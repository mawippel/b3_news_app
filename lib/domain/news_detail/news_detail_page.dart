import 'package:b3_news_app/components/ticker_symbol_builder.dart';
import 'package:b3_news_app/shared/models/sentiment.dart';
import 'package:b3_news_app/utils/colors.dart';
import 'package:collection/collection.dart';
import 'package:b3_news_app/components/sentiment_label_builder.dart';
import 'package:b3_news_app/domain/news_detail/chart_data_model.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:b3_news_app/shared/stores/main_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class NewsDetailPage extends StatelessWidget {
  NewsDetailPage(this.id) {
    mainStore.newsDetailStore.findNewsWithParagraphs(id);
  }

  final String id;
  final mainStore = GetIt.I.get<MainStore>();

  static const String name = '/home';

  final List<CircularStackEntry> data = <CircularStackEntry>[
    CircularStackEntry(
      <CircularSegmentEntry>[
        CircularSegmentEntry(50, Colors.green, rankKey: 'POSITIVE'),
        CircularSegmentEntry(50, Colors.red, rankKey: 'NEGATIVE'),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<ChartDataModel> _getChartValues() {
      final map = groupBy(mainStore.newsDetailStore.news.paragraphs,
          (paragraph) => paragraph.sentiment);
      final paragraphsLength = mainStore.newsDetailStore.news.paragraphs.length;
      return [
        if (map[Sentiment.POSITIVE]?.isNotEmpty ?? false)
          ChartDataModel(
            charts.MaterialPalette.green.shadeDefault,
            map[Sentiment.POSITIVE]?.length,
            paragraphsLength,
          ),
        if (map[Sentiment.NEGATIVE]?.isNotEmpty ?? false)
          ChartDataModel(
            charts.MaterialPalette.red.shadeDefault,
            map[Sentiment.NEGATIVE]?.length,
            paragraphsLength,
          ),
      ];
    }

    List<charts.Series<ChartDataModel, int>> _createChartData() {
      final data = _getChartValues();

      return [
        charts.Series<ChartDataModel, int>(
          id: 'paragraphs',
          domainFn: (ChartDataModel data, _) => data.value,
          measureFn: (ChartDataModel data, _) => data.value,
          colorFn: (ChartDataModel data, _) => data.color,
          labelAccessorFn: (ChartDataModel data, _) =>
              '${data.getPercentageValue().toStringAsFixed(2)}%',
          data: data,
        )
      ];
    }

    Widget _buildContent() {
      return Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Text(
              mainStore.newsDetailStore.news.title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            const Divider(),
            const SizedBox(height: 15),
            const Text(
              'Sentimento dos parágrafos',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 270,
              width: 270,
              child: charts.PieChart(
                _createChartData(),
                animate: true,
                defaultRenderer: charts.ArcRendererConfig(
                  arcWidth: 200,
                  arcRendererDecorators: [
                    charts.ArcLabelDecorator(
                      insideLabelStyleSpec: charts.TextStyleSpec(
                          color: charts.MaterialPalette.white, fontSize: 18),
                      outsideLabelStyleSpec: charts.TextStyleSpec(
                          color: charts.MaterialPalette.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Papéis citados',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Wrap(
              children: <Widget>[
                for (final stockTicker in mainStore.newsDetailStore.news.stocks
                    .map((stock) => stock.ticker)
                    .toList())
                  TickerSymbolBuilder.buildTickerSymbol(stockTicker),
              ],
            ),
          ],
        ),
      );
    }

    return Observer(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('InfoMoney'),
                if (!mainStore.newsDetailStore.isLoading)
                  SentimentLabelBuilder.buildSentimentLabel(
                      mainStore.newsDetailStore.news?.sentiment),
              ],
            ),
          ),
          body: ModalProgressHUD(
            opacity: 0.1,
            color: const Color.fromRGBO(253, 234, 160, 1),
            inAsyncCall: mainStore.newsDetailStore.isLoading,
            child: mainStore.newsDetailStore.isLoading
                ? Container()
                : SingleChildScrollView(child: _buildContent()),
          ),
        );
      },
    );
  }
}
