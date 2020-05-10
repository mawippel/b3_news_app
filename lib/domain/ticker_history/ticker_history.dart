import 'package:b3_news_app/utils/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TickerHistory extends StatefulWidget {
  const TickerHistory(this.ticker, this.publishDate);

  final String ticker;
  final DateTime publishDate;

  @override
  _TickerHistoryState createState() => _TickerHistoryState();
}

class _TickerHistoryState extends State<TickerHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Cotação ${widget.ticker}'),
            // FlatButton(
            //   onPressed: () => URLLauncher.launchURL('https://br.advfn.com/bolsa-de-valores/bovespa/ITSA4/historico'),
            //   child: Row(
            //     children: <Widget>[
            //       Icon(Icons.history),
            //       const SizedBox(
            //         width: 4,
            //       ),
            //       const Text('Hist. Cotações'),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
      body: Center(
        child: WebView(
          initialUrl:
              "https://br.tradingview.com/chart/?symbol=BMFBOVESPA%3A${widget.ticker}",
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
