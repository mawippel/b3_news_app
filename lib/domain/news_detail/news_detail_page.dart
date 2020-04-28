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
    return Scaffold(
      appBar: AppBar(
        title: const Text('InfoMoney'),
      ),
      body: Observer(
        builder: (_) {
          return ModalProgressHUD(
            opacity: 0.1,
            color: const Color.fromRGBO(253, 234, 160, 1),
            inAsyncCall: mainStore.newsDetailStore.isLoading,
            child: mainStore.newsDetailStore.isLoading
                ? Container()
                : Center(
                    child: Text(mainStore.newsDetailStore.news?.id ?? ''),
                  ),
          );
        },
      ),
    );
  }
}
