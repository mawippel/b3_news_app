import 'package:flutter/material.dart';
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
