import 'package:b3_news_app/shared/services/hive_service.dart';
import 'package:b3_news_app/shared/stores/main_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);

  static const String name = '/splash';

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final mainStore = GetIt.I.get<MainStore>();

  @override
  void initState() {
    super.initState();
    Future.wait(
      [
        // All the Futures that will be executed while loading
        Future.microtask(init).timeout(const Duration(seconds: 15)),
        Future.delayed(const Duration(seconds: 3)),
      ],
    );
  }

  Future init() async {
    mainStore.authStore.isAuthenticated = await hasUserAccess();
  }

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(
          child: Text('Splash Screen! Loading a bunch of useful data...'),
        ),
      );

  Future<bool> hasUserAccess() async {
    final box = await HiveService.openBox('authBox');
    return HiveService.get(box, 'access_token') != null;
  }
}
