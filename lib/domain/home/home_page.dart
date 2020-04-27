import 'package:b3_news_app/shared/models/news_model.dart';
import 'package:b3_news_app/shared/models/sentiment.dart';
import 'package:b3_news_app/shared/services/authentication_service.dart';
import 'package:b3_news_app/shared/stores/main_store.dart';
import 'package:b3_news_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class HomePage extends StatelessWidget {
  HomePage() {
    mainStore.homeStore.fetchNews();
  }

  final mainStore = GetIt.I.get<MainStore>();

  static const String name = '/home';

  @override
  Widget build(BuildContext context) {
    Widget _buildDrawer() {
      return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: B3NewsColors.primaryBlue,
                image: DecorationImage(
                  image: AssetImage('assets/fulllogo.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
              child: Container(),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: const Text('Sair'),
              onTap: AuthenticationService.logout,
            ),
          ],
        ),
      );
    }

    Widget _buildSentimentLabel(Sentiment sentiment) {
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

    Widget _buildListItem(NewsModel news) {
      return InkWell(
        onTap: () => print('xd'),
        splashColor: B3NewsColors.lightYellow,
        child: Column(
          children: <Widget>[
            Container(
              height: 100,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.only(right: 10),
                      child: ClipOval(
                        child: Image.network(
                          news.websitePhoto,
                          height: 65,
                          width: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                news.websiteName,
                                style: const TextStyle(fontSize: 17),
                              ),
                              _buildSentimentLabel(news.sentiment),
                            ],
                          ),
                          Text(
                            news.title,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Divider(),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Últimas Notícias'),
      ),
      drawer: _buildDrawer(),
      body: Observer(
        builder: (_) {
          return ModalProgressHUD(
            opacity: 0.1,
            color: const Color.fromRGBO(253, 234, 160, 1),
            inAsyncCall: mainStore.homeStore.isLoading,
            child: ListView.builder(
              itemCount: mainStore.homeStore.news.length,
              itemBuilder: (context, index) {
                return _buildListItem(mainStore.homeStore.news[index]);
              },
            ),
          );
        },
      ),
    );
  }

  Color _getColorBySentiment(Sentiment sentiment) {
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

  String _getTextBySentiment(Sentiment sentiment) {
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
