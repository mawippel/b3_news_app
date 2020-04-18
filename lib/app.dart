import 'package:b3_news_app/shared/providers/http_client.dart';
import 'package:b3_news_app/shared/stores/main_store.dart';
import 'package:b3_news_app/utils/routes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:oktoast/oktoast.dart';

class App extends StatelessWidget {
  App() {
    final getIt = GetIt.I;
    getIt.registerSingleton<MainStore>(MainStore());
    getIt.registerSingleton<HttpClient>(
        HttpClient(Dio(), DotEnv().env['BASE_URL']));
  }

  @override
  Widget build(BuildContext context) => OKToast(
        position: ToastPosition.bottom,
        handleTouth: true,
        dismissOtherOnShow: true,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: '/splash',
          navigatorKey: Get.key,
          routes: Routes.all(),
        ),
      );
}