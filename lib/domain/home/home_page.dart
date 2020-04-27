import 'package:b3_news_app/shared/services/authentication_service.dart';
import 'package:b3_news_app/utils/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

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

    Widget _buildSentimentLabel(String sentiment) {
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
          sentiment,
          style: const TextStyle(fontSize: 17),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Últimas Notícias'),
      ),
      drawer: _buildDrawer(),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Column(
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
                        child: CircleAvatar(
                          radius: 35.0,
                          backgroundImage: const NetworkImage(
                              'https://is2-ssl.mzstatic.com/image/thumb/Purple123/v4/5c/df/a9/5cdfa9b4-913f-8b4d-a99d-1c6f2662061e/AppIcon-0-1x_U007emarketing-0-0-85-220-0-4.png/1200x630wa.png'),
                          backgroundColor: Colors.transparent,
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
                                const Text(
                                  'InfoMoney',
                                  style: TextStyle(fontSize: 17),
                                ),
                                _buildSentimentLabel('POSITIVE'),
                              ],
                            ),
                            const Text(
                              'Bolsas da Europa abrem em baixa após decepção com a droga contra o coronavírus',
                              style: TextStyle(fontSize: 16),
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
          );
        },
      ),
    );
  }

  Color _getColorBySentiment(String sentiment) {
    switch (sentiment) {
      case 'POSITIVE':
        return Colors.green;
      case 'NEGATIVE':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
