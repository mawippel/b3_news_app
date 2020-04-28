import 'package:b3_news_app/components/sentiment_label_builder.dart';
import 'package:b3_news_app/domain/home/home_page.dart';
import 'package:b3_news_app/shared/stores/main_store.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    Widget _buildContent() {
      return Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Text(
              mainStore.newsDetailStore.news.title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
                SentimentLabelBuilder.buildSentimentLabel(
                    mainStore.newsDetailStore.news.sentiment),
              ],
            ),
          ),
          body: ModalProgressHUD(
            opacity: 0.1,
            color: const Color.fromRGBO(253, 234, 160, 1),
            inAsyncCall: mainStore.newsDetailStore.isLoading,
            child: mainStore.newsDetailStore.isLoading
                ? Container()
                : _buildContent(),
          ),
        );
      },
    );
  }
}
