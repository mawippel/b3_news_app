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
  String _buildPageContent() {
    return """
<html>
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
      <meta http-equiv="X-UA-Compatible" content="ie=edge">
      <title>B3NewsApp</title>
   </head>
   <body>
      <div class="tradingview-widget-container">
         <div id="tradingview_66b8c"></div>
         <div class="tradingview-widget-copyright"><a href="https://br.tradingview.com/symbols/${widget.ticker}/" rel="noopener" target="_blank">
         <a><span class="blue-text">Grafico ${widget.ticker}</span></a> por TradingView</div>
         <script type="text/javascript" src="https://s3.tradingview.com/tv.js"></script>
         <script type="text/javascript">
            new TradingView.widget(
            {
            "width": 980,
            "height": 400,
            "symbol": "${widget.ticker}",
            "interval": "D",
            "timezone": "Etc/UTC",
            "theme": "light",
            "style": "1",
            "locale": "br",
            "toolbar_bg": "#f1f3f6",
            "enable_publishing": false,
            "allow_symbol_change": true,
            "container_id": "tradingview_66b8c"
            }
            );
         </script>
      </div>
   </body>
</html>
                  """;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Cotação ${widget.ticker} - ${DateFormat('dd/MM/yyyy').format(widget.publishDate)}'),
      ),
      body: Center(
        child: WebView(
          initialUrl: "https://br.tradingview.com/chart/?symbol=BMFBOVESPA%3AITSA4",
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
