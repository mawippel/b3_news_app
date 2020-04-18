import 'package:b3_news_app/domain/home/home_page.dart';
import 'package:b3_news_app/domain/login/login_page.dart';
import 'package:b3_news_app/domain/register/register_page.dart';
import 'package:b3_news_app/domain/splash/splash_page.dart';
import 'package:flutter/material.dart';

class Routes {

  static Map<String, Widget Function(BuildContext)> all() => {
    LoginPage.name: (_) => LoginPage(),
    RegisterPage.name: (_) => const RegisterPage(),
    HomePage.name: (_) => const HomePage(),
    SplashPage.name: (_) => const SplashPage(),
  };
  
}