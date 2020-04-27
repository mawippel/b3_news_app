import 'package:b3_news_app/shared/stores/main_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class NewsDetailPage extends StatelessWidget {
  NewsDetailPage(this.id) {
    var as = 123;
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
      body: Center(
        child: Text(id),
      ),
    );
  }
}
