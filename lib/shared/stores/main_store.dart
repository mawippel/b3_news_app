import 'package:b3_news_app/domain/home/home_store.dart';
import 'package:b3_news_app/domain/login/login_store.dart';
import 'package:b3_news_app/domain/news_detail/news_detail_store.dart';
import 'package:b3_news_app/domain/register/register_store.dart';
import 'package:b3_news_app/shared/stores/auth_store.dart';
import 'package:mobx/mobx.dart';

part 'main_store.g.dart';

class MainStore = _MainStoreBase with _$MainStore;

abstract class _MainStoreBase with Store {

  // Set stores
  final LoginStore loginStore = LoginStore();
  final RegisterStore registerStore = RegisterStore();
  final AuthStore authStore = AuthStore();
  final HomeStore homeStore = HomeStore();
  final NewsDetailStore newsDetailStore = NewsDetailStore();
}
